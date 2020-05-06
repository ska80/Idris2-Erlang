module TTImp.PartialEval

import Core.CaseTree
import Core.Context
import Core.Core
import Core.Env
import Core.Hash
import Core.Metadata
import Core.Normalise
import Core.Value
import Core.UnifyState

import TTImp.Elab.Check
import TTImp.TTImp
import TTImp.Unelab

import Utils.Hex

%default covering

data ArgMode = Static (Term []) | Dynamic

Show ArgMode where
  show (Static tm) = "Static " ++ show tm
  show Dynamic = "Dynamic"

getStatic : ArgMode -> Maybe (Term [])
getStatic Dynamic = Nothing
getStatic (Static t) = Just t

unload : List (FC, Term vars) -> Term vars -> Term vars
unload [] fn = fn
unload ((fc, arg) :: args) fn = unload args (App fc fn arg)

specialiseTy : Nat -> List (Nat, Term []) -> Term vars -> Term vars
specialiseTy i specs (Bind fc x (Pi c p ty) sc)
    = case lookup i specs of
           Nothing => Bind fc x (Pi c Explicit ty) $ -- easier later if everything explicit
                        specialiseTy (1 + i) specs sc
           Just tm => specialiseTy (1 + i) specs (subst (embed tm) sc)
specialiseTy i specs tm = tm

substLoc : Nat -> Term vs -> Term vs -> Term vs
substLoc i tm (Local fc l idx p)
    = if i == idx then tm else (Local fc l idx p)
substLoc i tm (Bind fc x b sc)
    = Bind fc x (map (substLoc i tm) b) (substLoc (1 + i) (weaken tm) sc)
substLoc i tm (Meta fc n r args)
    = Meta fc n r (map (substLoc i tm) args)
substLoc i tm (App fc f a) = App fc (substLoc i tm f) (substLoc i tm a)
substLoc i tm (As fc s f a) = As fc s (substLoc i tm f) (substLoc i tm a)
substLoc i tm (TDelayed fc r d) = TDelayed fc r (substLoc i tm d)
substLoc i tm (TDelay fc r ty d) = TDelay fc r (substLoc i tm ty) (substLoc i tm d)
substLoc i tm (TForce fc r d) = TForce fc r (substLoc i tm d)
substLoc i tm x = x

substLocs : List (Nat, Term vs) -> Term vs -> Term vs
substLocs [] tm = tm
substLocs ((i, tm') :: subs) tm = substLocs subs (substLoc i tm' tm)

mkSubsts : Nat -> List (Nat, Term []) ->
           List (Term vs) -> Term vs -> Maybe (List (Nat, Term vs))
mkSubsts i specs [] rhs = Just []
mkSubsts i specs (arg :: args) rhs
    = do subs <- mkSubsts (1 + i) specs args rhs
         case lookup i specs of
              Nothing => Just subs
              Just tm => case arg of
                              Local _ _ idx _ =>
                                   Just ((idx, embed tm) :: subs)
                              As _ _ (Local _ _ idx1 _) (Local _ _ idx2 _) =>
                                   Just ((idx1, embed tm) :: (idx2, embed tm) :: subs)
                              As _ _ _ (Local _ _ idx _) =>
                                   Just ((idx, embed tm) :: subs)
                              _ => Nothing

-- In the case where all the specialised positions are variables on the LHS,
-- substitute the term in on the RHS
specPatByVar : List (Nat, Term []) ->
                (vs ** (Env Term vs, Term vs, Term vs)) ->
                Maybe (vs ** (Env Term vs, Term vs, Term vs))
specPatByVar specs (vs ** (env, lhs, rhs))
    = do let (fn, args) = getFnArgs lhs
         psubs <- mkSubsts 0 specs args rhs
         let lhs' = apply (getLoc fn) fn args
         pure (vs ** (env, substLocs psubs lhs', substLocs psubs rhs))

specByVar : List (Nat, Term []) ->
            List (vs ** (Env Term vs, Term vs, Term vs)) ->
            Maybe (List (vs ** (Env Term vs, Term vs, Term vs)))
specByVar specs [] = pure []
specByVar specs (p :: ps)
    = do p' <- specPatByVar specs p
         ps' <- specByVar specs ps
         pure (p' :: ps')

dropSpec : Nat -> List (Nat, Term []) -> List a -> List a
dropSpec i sargs [] = []
dropSpec i sargs (x :: xs)
    = case lookup i sargs of
           Nothing => x :: dropSpec (1 + i) sargs xs
           Just _ => dropSpec (1 + i) sargs xs

getSpecPats : {auto c : Ref Ctxt Defs} ->
              FC -> Name ->
              (fn : Name) -> (stk : List (FC, Term vars)) ->
              NF [] -> -- Type of 'fn'
              List (Nat, ArgMode) -> -- All the arguments
              List (Nat, Term []) -> -- Just the static ones
              List (vs ** (Env Term vs, Term vs, Term vs)) ->
              Core (Maybe (List ImpClause))
getSpecPats fc pename fn stk fnty args sargs pats
   = do -- First, see if all the specialised positions are variables. If so,
        -- substitute the arguments directly into the RHS
        let Nothing = specByVar sargs pats
            | Just specpats =>
                   do ps <- traverse (unelabPat pename) specpats
                      pure (Just ps)
        -- Otherwise, build a new definition by taking the remaining arguments
        -- on the lhs, and using the specialised function application on the rhs.
        -- Then, this will get evaluated on elaboration.
        let dynnames = mkDynNames 0 args
        let lhs = apply (IVar fc pename) (map (IBindVar fc) dynnames)
        rhs <- mkRHSargs fnty (IVar fc fn) dynnames args
        pure (Just [PatClause fc lhs rhs])
  where
    mkDynNames : Int -> List (Nat, ArgMode) -> List String
    mkDynNames i [] = []
    mkDynNames i ((_, Dynamic) :: as)
        = ("_pe" ++ show i) :: mkDynNames (1 + i) as
    mkDynNames i (_ :: as) = mkDynNames i as

    -- Build a RHS from the type of the function to be specialised, the
    -- dynamic argument names, and the list of given arguments. We assume
    -- the latter two correspond appropriately.
    mkRHSargs : NF [] -> RawImp -> List String -> List (Nat, ArgMode) ->
                Core RawImp
    mkRHSargs (NBind _ x (Pi _ Explicit _) sc) app (a :: as) ((_, Dynamic) :: ds)
        = do defs <- get Ctxt
             sc' <- sc defs (toClosure defaultOpts [] (Erased fc False))
             mkRHSargs sc' (IApp fc app (IVar fc (UN a))) as ds
    mkRHSargs (NBind _ x (Pi _ _ _) sc) app (a :: as) ((_, Dynamic) :: ds)
        = do defs <- get Ctxt
             sc' <- sc defs (toClosure defaultOpts [] (Erased fc False))
             mkRHSargs sc' (IImplicitApp fc app (Just x) (IVar fc (UN a))) as ds
    mkRHSargs (NBind _ x (Pi _ Explicit _) sc) app as ((_, Static tm) :: ds)
        = do defs <- get Ctxt
             sc' <- sc defs (toClosure defaultOpts [] (Erased fc False))
             tm' <- unelabNoSugar [] tm
             mkRHSargs sc' (IApp fc app tm') as ds
    mkRHSargs (NBind _ x (Pi _ _ _) sc) app as ((_, Static tm) :: ds)
        = do defs <- get Ctxt
             sc' <- sc defs (toClosure defaultOpts [] (Erased fc False))
             tm' <- unelabNoSugar [] tm
             mkRHSargs sc' (IImplicitApp fc app (Just x) tm') as ds
    mkRHSargs _ app _ _ = pure app

    getRawArgs : List (Maybe Name, RawImp) -> RawImp -> List (Maybe Name, RawImp)
    getRawArgs args (IApp _ f arg) = getRawArgs ((Nothing, arg) :: args) f
    getRawArgs args (IImplicitApp _ f (Just n) arg)
        = getRawArgs ((Just n, arg) :: args) f
    getRawArgs args tm = args

    reapply : RawImp -> List (Maybe Name, RawImp) -> RawImp
    reapply f [] = f
    reapply f ((Nothing, arg) :: args) = reapply (IApp fc f arg) args
    reapply f ((Just t, arg) :: args)
        = reapply (IImplicitApp fc f (Just t) arg) args

    dropArgs : Name -> RawImp -> RawImp
    dropArgs pename tm = reapply (IVar fc pename) (dropSpec 0 sargs (getRawArgs [] tm))

    unelabPat : Name -> (vs ** (Env Term vs, Term vs, Term vs)) ->
                Core ImpClause
    unelabPat pename (_ ** (env, lhs, rhs))
        = do lhsapp <- unelabNoSugar env lhs
             let lhs' = dropArgs pename lhsapp
             defs <- get Ctxt
             rhsnf <- normaliseArgHoles defs env rhs
             rhs' <- unelabNoSugar env rhsnf
             pure (PatClause fc lhs' rhs')

    unelabLHS : Name -> (vs ** (Env Term vs, Term vs, Term vs)) ->
                Core RawImp
    unelabLHS pename (_ ** (env, lhs, rhs))
        = do lhsapp <- unelabNoSugar env lhs
             pure $ dropArgs pename lhsapp

mkSpecDef : {auto c : Ref Ctxt Defs} ->
            {auto m : Ref MD Metadata} ->
            {auto u : Ref UST UState} ->
            FC -> GlobalDef ->
            Name -> List (Nat, ArgMode) -> Name -> List (FC, Term vars) ->
            Core (Term vars)
mkSpecDef {vars} fc gdef pename sargs fn stk
    = do defs <- get Ctxt
         let staticargs
               = mapMaybe (\ (x, s) => case s of
                                            Dynamic => Nothing
                                            Static t => Just (x, t)) sargs
         let peapp = unload (dropSpec 0 staticargs stk) (Ref fc Func pename)
         Nothing <- lookupCtxtExact pename (gamma defs)
             | Just _ => -- already specialised
                         do log 0 $ "Already specialised " ++ show pename
                            pure peapp
         logC 0 (do fnfull <- toFullNames fn
                    args' <- traverse (\ (i, arg) =>
                                 do arg' <- the (Core ArgMode) $ case arg of
                                                 Static a =>
                                                    pure $ Static !(toFullNames a)
                                                 Dynamic => pure Dynamic
                                    pure (show (i, arg'))) sargs
                    pure $ "Specialising " ++ show fnfull ++ " by " ++
                           showSep ", " args')
         let sty = specialiseTy 0 staticargs (type gdef)
         logTermNF 0 ("Specialised type " ++ show pename) [] sty

         -- Add as RigW - if it's something else, we don't need it at
         -- runtime anyway so this is wasted effort, therefore a failure
         -- is okay!
         peidx <- addDef pename (newDef fc pename top [] sty Public None)
         addToSave (Resolved peidx)
         setFlag fc (Resolved peidx) (PartialEval [(!(toFullNames fn), 65536)])

         let PMDef pminfo pmargs ct tr pats = definition gdef
             | _ => pure (unload stk (Ref fc Func fn))
         logC 0 (do inpats <- traverse unelabDef pats
                    pure $ "Attempting to specialise:\n" ++
                           showSep "\n" (map showPat inpats))

         Just newpats <- getSpecPats fc pename fn stk !(nf defs [] (type gdef))
                                     sargs staticargs pats
              | Nothing => pure (unload stk (Ref fc Func fn))
         log 0 $ "New patterns for " ++ show pename ++ ":\n" ++
                  showSep "\n" (map showPat newpats)

         processDecl [] (MkNested []) [] (IDef fc (Resolved peidx) newpats)
         pure peapp
  where
    updateApp : Name -> RawImp -> RawImp
    updateApp n (IApp fc f a) = IApp fc (updateApp n f) a
    updateApp n (IImplicitApp fc f m a) = IImplicitApp fc (updateApp n f) m a
    updateApp n f = IVar fc n

    unelabDef : (vs ** (Env Term vs, Term vs, Term vs)) ->
                Core ImpClause
    unelabDef (_ ** (env, lhs, rhs))
        = do lhs' <- unelabNoSugar env lhs
             defs <- get Ctxt
             rhsnf <- normaliseArgHoles defs env rhs
             rhs' <- unelabNoSugar env rhsnf
             pure (PatClause fc lhs' rhs')

    showPat : ImpClause -> String
    showPat (PatClause _ lhs rhs) = show lhs ++ " = " ++ show rhs
    showPat _ = "Can't happen"

-- Specialise a function name according to arguments. Return the specialised
-- application on success, or Nothing if it's not specialisable (due to static
-- arguments not being concrete)
specialise : {auto c : Ref Ctxt Defs} ->
             {auto m : Ref MD Metadata} ->
             {auto u : Ref UST UState} ->
             FC -> Env Term vars -> GlobalDef ->
             Name -> List (FC, Term vars) ->
             Core (Maybe (Term vars))
specialise {vars} fc env gdef fn stk
    = case specArgs gdef of
        [] => pure Nothing
        specs =>
            do fnfull <- toFullNames fn
               -- If all the arguments are concrete (meaning, no local variables
               -- or holes in them, so they can be a Term []) we can specialise
               Just sargs <- getSpecArgs 0 specs stk
                   | Nothing => pure Nothing
               let nhash = hash (mapMaybe getStatic (map snd sargs))
               let pename = NS ["_PE"]
                            (UN ("PE_" ++ nameRoot fnfull ++ "_" ++ asHex nhash))
               Just <$> mkSpecDef fc gdef pename sargs fn stk
  where
    dropAll : {vs : _} -> SubVars [] vs
    dropAll {vs = []} = SubRefl
    dropAll {vs = v :: vs} = DropCons dropAll

    concrete : Term vars -> Maybe (Term [])
    concrete tm = shrinkTerm tm dropAll

    getSpecArgs : Nat -> List Nat -> List (FC, Term vars) ->
                  Core (Maybe (List (Nat, ArgMode)))
    getSpecArgs i specs [] = pure (Just [])
    getSpecArgs i specs ((_, x) :: xs)
        = do Just xs' <- getSpecArgs (1 + i) specs xs
                 | Nothing => pure Nothing
             if i `elem` specs
                then do defs <- get Ctxt
                        x' <- normaliseHoles defs env x
                        let Just xok = concrete x'
                            | Nothing => pure Nothing
                        pure $ Just ((i, Static xok) :: xs')
                else pure $ Just ((i, Dynamic) :: xs')

findSpecs : {auto c : Ref Ctxt Defs} ->
            {auto m : Ref MD Metadata} ->
            {auto u : Ref UST UState} ->
            Env Term vars -> List (FC, Term vars) -> Term vars ->
            Core (Term vars)
findSpecs env stk (Ref fc Func fn)
    = do defs <- get Ctxt
         Just gdef <- lookupCtxtExact fn (gamma defs)
              | Nothing => pure (unload stk (Ref fc Func fn))
         Just r <- specialise fc env gdef fn stk
              | Nothing => pure (unload stk (Ref fc Func fn))
         pure r
findSpecs env stk (Meta fc n i args)
    = do args' <- traverse (findSpecs env []) args
         pure $ unload stk (Meta fc n i args')
findSpecs env stk (Bind fc x b sc)
    = do b' <- traverse (findSpecs env []) b
         sc' <- findSpecs (b' :: env) [] sc
         pure $ unload stk (Bind fc x b' sc')
findSpecs env stk (App fc fn arg)
    = do arg' <- findSpecs env [] arg
         findSpecs env ((fc, arg') :: stk) fn
findSpecs env stk (TDelayed fc r tm)
    = do tm' <- findSpecs env [] tm
         pure $ unload stk (TDelayed fc r tm')
findSpecs env stk (TDelay fc r ty tm)
    = do ty' <- findSpecs env [] ty
         tm' <- findSpecs env [] tm
         pure $ unload stk (TDelay fc r ty' tm')
findSpecs env stk (TForce fc r tm)
    = do tm' <- findSpecs env [] tm
         pure $ unload stk (TForce fc r tm')
findSpecs env stk tm = pure $ unload stk tm

bName : {auto q : Ref QVar Int} -> String -> Core Name
bName n
    = do i <- get QVar
         put QVar (i + 1)
         pure (MN n i)

-- This is like 'quote' in 'Normalise', except that when we encounter a
-- function name we need to check whether to specialise.
-- (Sorry about all the repetition - I don't really want to export those
-- internal details, and there is a small but crucial change where we call
-- quoteHead as compared with the version in Core.Normalise, to deal with
-- checking for specialised applications.)
mutual
  quoteArgs : {bound : _} ->
              {auto c : Ref Ctxt Defs} ->
              {auto m : Ref MD Metadata} ->
              {auto u : Ref UST UState} ->
              Ref QVar Int -> Defs -> Bounds bound ->
              Env Term free -> List (Closure free) ->
              Core (List (Term (bound ++ free)))
  quoteArgs q defs bounds env [] = pure []
  quoteArgs q defs bounds env (a :: args)
      = pure $ (!(quoteGenNF q defs bounds env !(evalClosure defs a)) ::
                !(quoteArgs q defs bounds env args))

  quoteHead : {bound : _} ->
              {auto c : Ref Ctxt Defs} ->
              {auto m : Ref MD Metadata} ->
              {auto u : Ref UST UState} ->
              Ref QVar Int -> Defs ->
              FC -> Bounds bound -> Env Term free -> NHead free ->
              Core (Term (bound ++ free))
  quoteHead {bound} q defs fc bounds env (NLocal mrig _ prf)
      = let MkVar prf' = addLater bound prf in
            pure $ Local fc mrig _ prf'
    where
      addLater : (ys : List Name) -> IsVar n idx xs ->
                 Var (ys ++ xs)
      addLater [] isv = MkVar isv
      addLater (x :: xs) isv
          = let MkVar isv' = addLater xs isv in
                MkVar (Later isv')
  quoteHead q defs fc bounds env (NRef Bound (MN n i))
      = case findName bounds of
             Just (MkVar p) => pure $ Local fc Nothing _ (varExtend p)
             Nothing => pure $ Ref fc Bound (MN n i)
    where
      findName : Bounds bound' -> Maybe (Var bound')
      findName None = Nothing
      findName (Add x (MN n' i') ns)
          = if i == i' -- this uniquely identifies it, given how we
                       -- generated the names, and is a faster test!
               then Just (MkVar First)
               else do MkVar p <-findName ns
                       Just (MkVar (Later p))
      findName (Add x _ ns)
          = do MkVar p <-findName ns
               Just (MkVar (Later p))
  quoteHead q defs fc bounds env (NRef nt n) = pure $ Ref fc nt n
  quoteHead q defs fc bounds env (NMeta n i args)
      = do args' <- quoteArgs q defs bounds env args
           pure $ Meta fc n i args'

  quotePi : {bound : _} ->
            {auto c : Ref Ctxt Defs} ->
            {auto m : Ref MD Metadata} ->
            {auto u : Ref UST UState} ->
            Ref QVar Int -> Defs -> Bounds bound ->
            Env Term free -> PiInfo (NF free) ->
            Core (PiInfo (Term (bound ++ free)))
  quotePi q defs bounds env Explicit = pure Explicit
  quotePi q defs bounds env Implicit = pure Implicit
  quotePi q defs bounds env AutoImplicit = pure AutoImplicit
  quotePi q defs bounds env (DefImplicit t)
      = do t' <- quoteGenNF q defs bounds env t
           pure (DefImplicit t')

  quoteBinder : {bound : _} ->
                {auto c : Ref Ctxt Defs} ->
                {auto m : Ref MD Metadata} ->
                {auto u : Ref UST UState} ->
                Ref QVar Int -> Defs -> Bounds bound ->
                Env Term free -> Binder (NF free) ->
                Core (Binder (Term (bound ++ free)))
  quoteBinder q defs bounds env (Lam r p ty)
      = do ty' <- quoteGenNF q defs bounds env ty
           p' <- quotePi q defs bounds env p
           pure (Lam r p' ty')
  quoteBinder q defs bounds env (Let r val ty)
      = do val' <- quoteGenNF q defs bounds env val
           ty' <- quoteGenNF q defs bounds env ty
           pure (Let r val' ty')
  quoteBinder q defs bounds env (Pi r p ty)
      = do ty' <- quoteGenNF q defs bounds env ty
           p' <- quotePi q defs bounds env p
           pure (Pi r p' ty')
  quoteBinder q defs bounds env (PVar r p ty)
      = do ty' <- quoteGenNF q defs bounds env ty
           p' <- quotePi q defs bounds env p
           pure (PVar r p' ty')
  quoteBinder q defs bounds env (PLet r val ty)
      = do val' <- quoteGenNF q defs bounds env val
           ty' <- quoteGenNF q defs bounds env ty
           pure (PLet r val' ty')
  quoteBinder q defs bounds env (PVTy r ty)
      = do ty' <- quoteGenNF q defs bounds env ty
           pure (PVTy r ty')

  quoteGenNF : {bound : _} ->
               {auto c : Ref Ctxt Defs} ->
               {auto m : Ref MD Metadata} ->
               {auto u : Ref UST UState} ->
               Ref QVar Int ->
               Defs -> Bounds bound ->
               Env Term vars -> NF vars -> Core (Term (bound ++ vars))
  quoteGenNF q defs bound env (NBind fc n b sc)
      = do var <- bName "qv"
           sc' <- quoteGenNF q defs (Add n var bound) env
                       !(sc defs (toClosure defaultOpts env (Ref fc Bound var)))
           b' <- quoteBinder q defs bound env b
           pure (Bind fc n b' sc')
  -- IMPORTANT CASE HERE
  -- If fn is to be specialised, quote the args directly (no further
  -- reduction) then call specialise. Otherwise, quote as normal
  quoteGenNF q defs bound env (NApp fc (NRef Func fn) args)
      = do Just gdef <- lookupCtxtExact fn (gamma defs)
                | Nothing => do args' <- quoteArgs q defs bound env args
                                pure $ apply fc (Ref fc Func fn) args'
           case specArgs gdef of
                [] => do args' <- quoteArgs q defs bound env args
                         pure $ apply fc (Ref fc Func fn) args'
                _ => do empty <- clearDefs defs
                        -- Use the empty global context for the args so that we don't
                        -- reduce names prematurely if this static function gets stuck
                        args' <- quoteArgs q empty bound env args
                        Just r <- specialise fc (extendEnv bound env) gdef fn (map (\t => (fc, t)) args')
                             | Nothing => -- can't specialise, quote normally 
                                  do args' <- quoteArgs q defs bound env args
                                     pure $ apply fc (Ref fc Func fn) args'
                        pure r
     where
       extendEnv : Bounds bs -> Env Term vs -> Env Term (bs ++ vs)
       extendEnv None env = env
       extendEnv (Add x n bs) env
           -- We're just using this to evaluate holes in the right scope, so
           -- a placeholder binder is fine
           = Lam top Explicit (Erased fc False) :: extendEnv bs env
  quoteGenNF q defs bound env (NApp fc f args)
      = do f' <- quoteHead q defs fc bound env f
           args' <- quoteArgs q defs bound env args
           pure $ apply fc f' args'
  quoteGenNF q defs bound env (NDCon fc n t ar args)
      = do args' <- quoteArgs q defs bound env args
           pure $ apply fc (Ref fc (DataCon t ar) n) args'
  quoteGenNF q defs bound env (NTCon fc n t ar args)
      = do args' <- quoteArgs q defs bound env args
           pure $ apply fc (Ref fc (TyCon t ar) n) args'
  quoteGenNF q defs bound env (NAs fc s n pat)
      = do n' <- quoteGenNF q defs bound env n
           pat' <- quoteGenNF q defs bound env pat
           pure (As fc s n' pat')
  quoteGenNF q defs bound env (NDelayed fc r arg)
      = do argQ <- quoteGenNF q defs bound env arg
           pure (TDelayed fc r argQ)
  quoteGenNF q defs bound env (NDelay fc r ty arg)
      = do argNF <- evalClosure defs (toHolesOnly arg)
           argQ <- quoteGenNF q defs bound env argNF
           tyNF <- evalClosure defs (toHolesOnly ty)
           tyQ <- quoteGenNF q defs bound env tyNF
           pure (TDelay fc r tyQ argQ)
    where
      toHolesOnly : Closure vs -> Closure vs
      toHolesOnly (MkClosure _ locs env tm)
          = MkClosure withHoles locs env tm
      toHolesOnly c = c
  quoteGenNF q defs bound env (NForce fc r arg args)
      = do args' <- quoteArgs q defs bound env args
           case arg of
                NDelay fc _ _ arg =>
                   do argNF <- evalClosure defs arg
                      pure $ apply fc !(quoteGenNF q defs bound env argNF) args'
                _ => do arg' <- quoteGenNF q defs bound env arg
                        pure $ apply fc (TForce fc r arg') args'
  quoteGenNF q defs bound env (NPrimVal fc c) = pure $ PrimVal fc c
  quoteGenNF q defs bound env (NErased fc i) = pure $ Erased fc i
  quoteGenNF q defs bound env (NType fc) = pure $ TType fc

evalRHS : {auto c : Ref Ctxt Defs} ->
          {auto m : Ref MD Metadata} ->
          {auto u : Ref UST UState} ->
          Env Term vars -> NF vars -> Core (Term vars)
evalRHS env nf
    = do q <- newRef QVar 0
         defs <- get Ctxt
         quoteGenNF q defs None env nf

export
applySpecialise : {auto c : Ref Ctxt Defs} ->
                  {auto m : Ref MD Metadata} ->
                  {auto u : Ref UST UState} ->
                  Env Term vars ->
                  Maybe (List (Name, Nat)) ->
                        -- ^ If we're specialising, names to reduce in the RHS
                        -- with their reduction limits
                  Term vars -> -- initial RHS
                  Core (Term vars)
applySpecialise env Nothing tm
    = findSpecs env [] tm -- not specialising, just search through RHS
applySpecialise env (Just ls) tm -- specialising, evaluate RHS while looking
                                 -- for names to specialise
    = do defs <- get Ctxt
         let nopts = record { reduceLimit = ls } defaultOpts
         tm' <- evalRHS env !(nfOpts nopts defs env tm)
         tmfull <- toFullNames tm'
         logTerm 0 ("New RHS") tmfull
         pure tmfull
