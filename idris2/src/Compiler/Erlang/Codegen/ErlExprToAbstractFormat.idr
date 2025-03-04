module Compiler.Erlang.Codegen.ErlExprToAbstractFormat

import Data.List
import Data.Nat
import Control.Monad.State

import public Compiler.Erlang.IR.ErlExpr
import public Compiler.Erlang.IR.AbstractFormat
import Compiler.Erlang.Codegen.ErlExprToAbstractFormat.Internal
import Compiler.Erlang.Codegen.ErlExprToAbstractFormat.Binary
import Compiler.Erlang.Codegen.ErlExprToAbstractFormat.Buffer
import Compiler.Erlang.Codegen.ErlExprToAbstractFormat.Serialise
import Compiler.Erlang.Utils.String


%default total
%hide ErlExpr.Line


-- GUARD COMBINATORS

guardAnd : Maybe Guard -> Maybe Guard -> Maybe Guard
guardAnd Nothing Nothing = Nothing
guardAnd Nothing (Just y) = Just y
guardAnd (Just x) Nothing = Just x
guardAnd (Just x) (Just y) = Just (AGOp (getGuardLine x) "andalso" x y)

guardToGuardAlts : Maybe Guard -> List GuardAlt
guardToGuardAlts Nothing = []
guardToGuardAlts (Just x) = [MkGuardAlt (singleton x)]


-- HELPER FUNCTIONS

varsToVarNames : (vars : List LocalVar) -> Vect (length vars) String
varsToVarNames [] = []
varsToVarNames (x :: xs) = show x :: varsToVarNames xs

record MatcherClause where
  constructor MkMatcherClause
  pattern : Pattern
  guard : Maybe Guard
  body : Expr
  preComputedValues : List (LocalVar, Expr)

wrapPreComputedValues : Line -> List (LocalVar, Expr) -> Expr -> Expr
wrapPreComputedValues l [] body =
  body -- Do not wrap in AEBlock unnecessarily
wrapPreComputedValues l preComputedValues@(_ :: _) body =
  AEBlock l (map toLet preComputedValues `lappend` singleton body)
  where
    toLet : (LocalVar, Expr) -> Expr
    toLet (var, value) = AEMatch l (APVar l (show var)) value


-- CODE GENERATION

genIdrisConstant : Line -> (String -> a) -> (Literal -> a) -> IdrisConstant -> a
genIdrisConstant l fromStringValue fromLiteral constant =
  case constant of
    IInt x => fromLiteral (ALInteger l (cast x))
    IInt8 x => fromLiteral (ALInteger l (cast x))
    IInt16 x => fromLiteral (ALInteger l (cast x))
    IInt32 x => fromLiteral (ALInteger l (cast x))
    IInt64 x => fromLiteral (ALInteger l (cast x))
    IInteger x => fromLiteral (ALInteger l x)
    IB8 x => fromLiteral (ALInteger l (cast x))
    IB16 x => fromLiteral (ALInteger l (cast x))
    IB32 x => fromLiteral (ALInteger l (cast x))
    IB64 x => fromLiteral (ALInteger l (cast x))
    IString x => fromStringValue x
    IChar x => fromLiteral (ALChar l x)
    IDouble x => fromLiteral (ALFloat l x)
    IWorldVal => fromLiteral (ALAtom l "world_val")
    IIntType => fromLiteral (ALAtom l "int_type")
    IInt8Type => fromLiteral (ALAtom l "int8_type")
    IInt16Type => fromLiteral (ALAtom l "int16_type")
    IInt32Type => fromLiteral (ALAtom l "int32_type")
    IInt64Type => fromLiteral (ALAtom l "int64_type")
    IIntegerType => fromLiteral (ALAtom l "integer_type")
    IBits8Type => fromLiteral (ALAtom l "bits8_type")
    IBits16Type => fromLiteral (ALAtom l "bits16_type")
    IBits32Type => fromLiteral (ALAtom l "bits32_type")
    IBits64Type => fromLiteral (ALAtom l "bits64_type")
    IStringType => fromLiteral (ALAtom l "string_type")
    ICharType => fromLiteral (ALAtom l "char_type")
    IDoubleType => fromLiteral (ALAtom l "double_type")
    IWorldType => fromLiteral (ALAtom l "world_type")

constExprToPattern : ErlExpr -> Maybe Pattern
constExprToPattern (ELocal l var) = pure $ APVar l (show var)
constExprToPattern (ERef l modName fnName) = Nothing
constExprToPattern (ELam l args body) = Nothing
constExprToPattern (ELet l newVar value body) = Nothing
constExprToPattern (ESequence l statements) = Nothing
constExprToPattern (EApp l expr args) = Nothing
constExprToPattern (EOp l op lhs rhs) = Nothing -- TODO: Could potentially work
constExprToPattern (ECon l name xs) = do
  exprs <- assert_total $ traverse constExprToPattern xs
  pure $ APTuple l (APLiteral (ALAtom l name) :: exprs)
constExprToPattern (EConstCase l sc xs def) = Nothing
constExprToPattern (EMatcherCase l sc xs def) = Nothing
constExprToPattern (EReceive l xs timeout def) = Nothing
constExprToPattern (ETryCatch l tryExpr okVar okExpr errorVar errorExpr) = Nothing
constExprToPattern (EBinaryConcat l bin1 bin2) = Nothing
constExprToPattern (EIdrisConstant l x) = pure $ genIdrisConstant l (genStringLiteralPattern l) APLiteral x
constExprToPattern (EAtom l x) = pure $ APLiteral (ALAtom l x)
constExprToPattern (EChar l x) = pure $ APLiteral (ALChar l x)
constExprToPattern (EFloat l x) = pure $ APLiteral (ALFloat l x)
constExprToPattern (EInteger l x) = pure $ APLiteral (ALInteger l x)
constExprToPattern (ECharlist l x) = pure $ APLiteral (ALCharlist l x)
constExprToPattern (EBinary l x) = pure $ genStringLiteralPattern l x
constExprToPattern (ENil l) = pure $ APNil l
constExprToPattern (ECons l x y) = pure $ APCons l !(constExprToPattern x) !(constExprToPattern y)
constExprToPattern (ETuple l xs) = do
  elems <- assert_total $ traverse constExprToPattern xs
  pure $ APTuple l elems
constExprToPattern (EMap l xs) = Nothing -- TODO: Could potentially work
constExprToPattern (EBufferNew l size) = Nothing
constExprToPattern (EBufferResize l bin newSize) = Nothing
constExprToPattern (EBufferFlatten l bin maxbytes) = Nothing
constExprToPattern (EBufferSetBits8 l bin loc value) = Nothing
constExprToPattern (EBufferGetBits8 l bin loc) = Nothing
constExprToPattern (EBufferSetBits16 l bin loc value) = Nothing
constExprToPattern (EBufferGetBits16 l bin loc) = Nothing
constExprToPattern (EBufferSetBits32 l bin loc value) = Nothing
constExprToPattern (EBufferGetBits32 l bin loc) = Nothing
constExprToPattern (EBufferSetBits64 l bin loc value) = Nothing
constExprToPattern (EBufferGetBits64 l bin loc) = Nothing
constExprToPattern (EBufferSetInt32 l bin loc value) = Nothing
constExprToPattern (EBufferGetInt32 l bin loc) = Nothing
constExprToPattern (EBufferSetInt64 l bin loc value) = Nothing
constExprToPattern (EBufferGetInt64 l bin loc) = Nothing
constExprToPattern (EBufferSetDouble l bin loc value) = Nothing
constExprToPattern (EBufferGetDouble l bin loc) = Nothing
constExprToPattern (EBufferSetString l bin loc value) = Nothing
constExprToPattern (EBufferGetString l bin loc len) = Nothing
constExprToPattern (ESerialiseWriteInt bits l builder value) = Nothing
constExprToPattern (ESerialiseReadInt bits l it) = Nothing
constExprToPattern (ESerialiseWriteBits bits l builder value) = Nothing
constExprToPattern (ESerialiseReadBits bits l it) = Nothing
constExprToPattern (ESerialiseWriteBinary l builder value) = Nothing
constExprToPattern (ESerialiseReadBinary l it) = Nothing
constExprToPattern (ESerialiseWriteChar l builder value) = Nothing
constExprToPattern (ESerialiseReadChar l it) = Nothing
constExprToPattern (ESerialiseWriteDouble l builder value) = Nothing
constExprToPattern (ESerialiseReadDouble l it) = Nothing

mutual
  genErlExpr : ErlExpr -> State LocalVars Expr
  genErlExpr (ELocal l var) =
    pure $ AEVar l (show var)
  genErlExpr (ERef l modName fnName) =
    pure $ AERemoteRef l !(genErlExpr modName) !(genErlExpr fnName)
  genErlExpr (ELam l args body) = do
    let varNames = varsToVarNames args
    body' <- genErlExpr body
    pure $ AEFun l (length args) (singleton $ MkFunClause l (map (APVar l) varNames) [] (singleton body'))
  genErlExpr (ELet l newVar value body) = do
    let varName = show newVar
    value' <- genErlExpr value
    body' <- genErlExpr body
    pure $ AEBlock l (AEMatch l (APVar l varName) value' ::: [body'])
  genErlExpr (ESequence l statements) = do
    statements' <- assert_total $ traverse genErlExpr statements
    pure $ AEBlock l statements'
  genErlExpr (EApp l expr args) = do
    expr' <- genErlExpr expr
    args' <- assert_total $ traverse genErlExpr args
    pure $ AEFunCall l expr' args'
  genErlExpr (EOp l opName x y) =
    pure $ AEOp l opName !(genErlExpr x) !(genErlExpr y)
  genErlExpr (ECon l name exprs) = do
    exprs' <- assert_total $ traverse genErlExpr exprs
    pure $ genDataCtorExpr l name exprs'
  genErlExpr (EConstCase l sc clauses def) = do
    def' <- assert_total $ traverse genErlExpr def
    let defClause = map (\x => MkCaseClause l (APUniversal l) [] (singleton x)) def'
    generatedClauses <- assert_total $ traverse (genErlConstAlt l) clauses
    pure $ AECase l !(genErlExpr sc) (generatedClauses `appendl` toList defClause)
  genErlExpr (EMatcherCase l sc matchers def) = do
    def' <- assert_total $ traverse genErlExpr def
    let defClause = map (\x => MkCaseClause l (APUniversal l) [] (singleton x)) def'
    generatedClauses <- assert_total (traverse (genErlMatcher l) matchers)
    let caseExpr = AECase l !(genErlExpr sc) (map fst generatedClauses `appendl` toList defClause)
    pure $ wrapPreComputedValues l (concatMap snd (toList generatedClauses)) caseExpr
  -- EReceive generates the following code.
  --
  -- If matchers contain `MExact` or `MMapSubset`, the values will be pre-computed to allow
  -- the case expression to refer to existing bindings.
  --
  -- ```
  -- receive
  --   `matchers`
  -- after
  --   `timeout` ->
  --     `def`
  -- end
  -- ```
  genErlExpr (EReceive l matchers timeout def) = do
    let defClause = TimeoutAfter !(genErlExpr timeout) (singleton !(genErlExpr def))
    generatedClauses <- assert_total (traverse (genErlMatcher l) matchers)
    let receiveExpr = AEReceive l (map fst generatedClauses) defClause
    pure $ wrapPreComputedValues l (concatMap snd generatedClauses) receiveExpr
  -- ETryCatch generates the following code.
  --
  -- ```
  -- try `tryExpr` of
  --   `okVar` ->
  --     `okExpr`
  -- catch
  --   Class:Reason:Stacktrace ->
  --     `errorVar` = {Class, Reason, Stacktrace},
  --     `errorExpr`
  -- end
  -- ```
  genErlExpr (ETryCatch l tryExpr okVar okExpr errorVar errorExpr) = do
    exClassVar <- newLocalVar
    exReasonVar <- newLocalVar
    exStacktraceVar <- newLocalVar
    let exceptionValue = AETuple l [AEVar l (show exClassVar), AEVar l (show exReasonVar), AEVar l (show exStacktraceVar)]
    let tryCaseClause = MkCaseClause l (APVar l (show okVar)) [] (singleton !(genErlExpr okExpr))
    let tryCatchClause = MkCatchClause l (APVar l (show exClassVar)) (APVar l (show exReasonVar)) (APVar l (show exStacktraceVar)) []
          ( AEMatch l (APVar l (show errorVar)) exceptionValue :::
            [ !(genErlExpr errorExpr)
            ]
          )
    pure $ AETry l (singleton !(genErlExpr tryExpr)) [tryCaseClause] [tryCatchClause] []
  genErlExpr (EBinaryConcat l bin1 bin2) =
    pure $ Binary.concat l !(genErlExpr bin1) !(genErlExpr bin2)
  genErlExpr (EIdrisConstant l x) =
    pure $ genIdrisConstant l (genStringLiteralExpr l) AELiteral x
  genErlExpr (EAtom l x) =
    pure $ AELiteral (ALAtom l x)
  genErlExpr (EChar l x) =
    pure $ AELiteral (ALChar l x)
  genErlExpr (EFloat l x) =
    pure $ AELiteral (ALFloat l x)
  genErlExpr (EInteger l x) =
    pure $ AELiteral (ALInteger l x)
  genErlExpr (ECharlist l x) =
    pure $ AELiteral (ALCharlist l x)
  genErlExpr (EBinary l x) =
    pure $ genStringLiteralExpr l x
  genErlExpr (ENil l) =
    pure $ AENil l
  genErlExpr (ECons l x y) =
    pure $ AECons l !(genErlExpr x) !(genErlExpr y)
  genErlExpr (ETuple l elems) = do
    elems' <- assert_total $ traverse genErlExpr elems
    pure $ AETuple l elems'
  genErlExpr (EMap l entries) = do
    entries' <- assert_total $ traverse (\(key, value) => pure $ MkAssoc l !(genErlExpr key) !(genErlExpr value)) entries
    pure $ AEMapNew l entries'
  genErlExpr (EBufferNew l size) =
    pure $ Buffer.new l !(genErlExpr size)
  genErlExpr (EBufferResize l bin newSize) =
    pure $ Buffer.resize l !(genErlExpr bin) !(genErlExpr newSize)
  genErlExpr (EBufferFlatten l bin maxbytes) =
    pure $ Buffer.flatten l !(genErlExpr bin) !(genErlExpr maxbytes)
  genErlExpr (EBufferSetBits8 l bin loc value) =
    pure $ Buffer.setUnsignedInt 8 l !(genErlExpr bin) !(genErlExpr loc) !(genErlExpr value)
  genErlExpr (EBufferGetBits8 l bin loc) =
    pure $ Buffer.getUnsignedInt 8 l !(genErlExpr bin) !(genErlExpr loc)
  genErlExpr (EBufferSetBits16 l bin loc value) =
    pure $ Buffer.setUnsignedInt 16 l !(genErlExpr bin) !(genErlExpr loc) !(genErlExpr value)
  genErlExpr (EBufferGetBits16 l bin loc) =
    pure $ Buffer.getUnsignedInt 16 l !(genErlExpr bin) !(genErlExpr loc)
  genErlExpr (EBufferSetBits32 l bin loc value) =
    pure $ Buffer.setUnsignedInt 32 l !(genErlExpr bin) !(genErlExpr loc) !(genErlExpr value)
  genErlExpr (EBufferGetBits32 l bin loc) =
    pure $ Buffer.getUnsignedInt 32 l !(genErlExpr bin) !(genErlExpr loc)
  genErlExpr (EBufferSetBits64 l bin loc value) =
    pure $ Buffer.setUnsignedInt 64 l !(genErlExpr bin) !(genErlExpr loc) !(genErlExpr value)
  genErlExpr (EBufferGetBits64 l bin loc) =
    pure $ Buffer.getUnsignedInt 64 l !(genErlExpr bin) !(genErlExpr loc)
  genErlExpr (EBufferSetInt32 l bin loc value) =
    pure $ Buffer.setSignedInt 32 l !(genErlExpr bin) !(genErlExpr loc) !(genErlExpr value)
  genErlExpr (EBufferGetInt32 l bin loc) =
    pure $ Buffer.getSignedInt 32 l !(genErlExpr bin) !(genErlExpr loc)
  genErlExpr (EBufferSetInt64 l bin loc value) =
    pure $ Buffer.setSignedInt 64 l !(genErlExpr bin) !(genErlExpr loc) !(genErlExpr value)
  genErlExpr (EBufferGetInt64 l bin loc) =
    pure $ Buffer.getSignedInt 64 l !(genErlExpr bin) !(genErlExpr loc)
  genErlExpr (EBufferSetDouble l bin loc value) =
    pure $ Buffer.setDouble l !(genErlExpr bin) !(genErlExpr loc) !(genErlExpr value)
  genErlExpr (EBufferGetDouble l bin loc) =
    pure $ Buffer.getDouble l !(genErlExpr bin) !(genErlExpr loc)
  genErlExpr (EBufferSetString l bin loc value) =
    pure $ Buffer.setString l !(genErlExpr bin) !(genErlExpr loc) !(genErlExpr value)
  genErlExpr (EBufferGetString l bin loc len) =
    pure $ Buffer.getString l !(genErlExpr bin) !(genErlExpr loc) !(genErlExpr len)
  genErlExpr (ESerialiseWriteInt bits l builder value) =
    pure $ Serialise.setSignedInt bits l !(genErlExpr builder) !(genErlExpr value)
  genErlExpr (ESerialiseReadInt bits l it) =
    pure $ Serialise.getSignedInt bits l !(genErlExpr it)
  genErlExpr (ESerialiseWriteBits bits l builder value) =
    pure $ Serialise.setUnsignedInt bits l !(genErlExpr builder) !(genErlExpr value)
  genErlExpr (ESerialiseReadBits bits l it) =
    pure $ Serialise.getUnsignedInt bits l !(genErlExpr it)
  genErlExpr (ESerialiseWriteBinary l builder value) =
    pure $ Serialise.setBinary l !(genErlExpr builder) !(genErlExpr value)
  genErlExpr (ESerialiseReadBinary l it) =
    pure $ Serialise.getBinary l !(genErlExpr it)
  genErlExpr (ESerialiseWriteChar l builder value) =
    pure $ Serialise.setUnsignedInt 32 l !(genErlExpr builder) !(genErlExpr value)
  genErlExpr (ESerialiseReadChar l it) =
    pure $ Serialise.getUnsignedInt 32 l !(genErlExpr it)
  genErlExpr (ESerialiseWriteDouble l builder value) =
    pure $ Serialise.setDouble l !(genErlExpr builder) !(genErlExpr value)
  genErlExpr (ESerialiseReadDouble l it) =
    pure $ Serialise.getDouble l !(genErlExpr it)

  genErlConstAlt : Line -> ErlConstAlt -> State LocalVars CaseClause
  genErlConstAlt l (MkConstAlt constant body) = do
    let pattern = genIdrisConstant l (genStringLiteralPattern l) APLiteral constant
    pure $ MkCaseClause l pattern [] (singleton !(genErlExpr body))

  genErlMatcher : Line -> ErlMatcher -> State LocalVars (CaseClause, List (LocalVar, Expr))
  genErlMatcher l matcher = do
    clause <- readErlMatcher l matcher
    pure
      ( MkCaseClause l (pattern clause) (guardToGuardAlts (guard clause)) (singleton $ body clause)
      , preComputedValues clause
      )

  readErlMatcher : Line -> ErlMatcher -> State LocalVars MatcherClause
  readErlMatcher l (MExact expr) =
    case constExprToPattern expr of
      Just pattern => do
        let guard = neutral
        let body = !(genErlExpr expr)
        pure $ MkMatcherClause pattern guard body []
      Nothing => do
        localVar <- newLocalVar
        matchExactVar <- newLocalVar
        matchExactValue <- genErlExpr expr
        let pattern = APVar l (show localVar)
        let guard = Just $ AGOp l "=:=" (AGVar l (show localVar)) (AGVar l (show matchExactVar))
        let body = AEVar l (show localVar)
        pure $ MkMatcherClause pattern guard body [(matchExactVar, matchExactValue)]
  readErlMatcher l MAny = do
    localVar <- newLocalVar
    let pattern = APVar l (show localVar)
    let guard = neutral
    let body = AEVar l (show localVar)
    pure $ MkMatcherClause pattern guard body []
  readErlMatcher l MCodepoint = do
    localVar <- newLocalVar
    let pattern = APVar l (show localVar)
    let guardVar = AGVar l (show localVar)
    let isIntegerGuard = AGFunCall l "is_integer" [guardVar]
    let lowRangeGuard =
          AGOp l "andalso"
            (AGOp l ">=" guardVar (AGLiteral (ALInteger l 0)))
            (AGOp l "=<" guardVar (AGLiteral (ALInteger l 0xD7FF)))
    let highRangeGuard =
          AGOp l "andalso"
            (AGOp l ">=" guardVar (AGLiteral (ALInteger l 0xE000)))
            (AGOp l "=<" guardVar (AGLiteral (ALInteger l 0x10FFFF)))
    let guard = Just $ AGOp l "andalso" isIntegerGuard (AGOp l "orelse" lowRangeGuard highRangeGuard)
    let body = AEVar l (show localVar)
    pure $ MkMatcherClause pattern guard body []
  readErlMatcher l MInteger = readSimpleGuardMatcherClause l "is_integer"
  readErlMatcher l MFloat = readSimpleGuardMatcherClause l "is_float"
  readErlMatcher l MAtom = readSimpleGuardMatcherClause l "is_atom"
  readErlMatcher l MBinary = readSimpleGuardMatcherClause l "is_binary"
  readErlMatcher l MMap = readSimpleGuardMatcherClause l "is_map"
  readErlMatcher l MPid = readSimpleGuardMatcherClause l "is_pid"
  readErlMatcher l MRef = readSimpleGuardMatcherClause l "is_reference"
  readErlMatcher l MPort = readSimpleGuardMatcherClause l "is_port"
  readErlMatcher l MAnyList = readSimpleGuardMatcherClause l "is_list"
  readErlMatcher l MNil = do
    let pattern = APNil l
    let guard = neutral
    let body = AENil l
    pure $ MkMatcherClause pattern guard body []
  readErlMatcher l (MCons x y hdVar tlVar fun) = do
    xClause <- readErlMatcher l x
    yClause <- readErlMatcher l y
    let varNames = varsToVarNames [hdVar, tlVar]
    let wrappedFun = AEFun l 2 (singleton $ MkFunClause l (map (APVar l) varNames) [] (singleton !(genErlExpr fun)))
    let pattern = APCons l (pattern xClause) (pattern yClause)
    let guard = guard xClause `guardAnd` guard yClause
    let body = AEFunCall l wrappedFun [body xClause, body yClause]
    pure $ MkMatcherClause pattern guard body (preComputedValues xClause ++ preComputedValues yClause)
  readErlMatcher l (MList matchers fun) = do
    erlMatchers <- readErlMatchers l matchers
    let args = map fst erlMatchers
    let clauses = map snd erlMatchers
    let varNames = varsToVarNames args
    let wrappedFun = AEFun l (length args) (singleton $ MkFunClause l (map (APVar l) varNames) [] (singleton !(genErlExpr fun)))
    let pattern = foldr (\clause, acc => APCons l (pattern clause) acc) (APNil l) clauses
    let guard = foldl (\acc, clause => guard clause `guardAnd` acc) Nothing clauses
    let body = AEFunCall l wrappedFun (map body clauses)
    pure $ MkMatcherClause pattern guard body (concatMap preComputedValues clauses)
  readErlMatcher l (MTuple matchers fun) = do
    erlMatchers <- readErlMatchers l matchers
    let args = map fst erlMatchers
    let clauses = map snd erlMatchers
    let varNames = varsToVarNames args
    let wrappedFun = AEFun l (length args) (singleton $ MkFunClause l (map (APVar l) varNames) [] (singleton !(genErlExpr fun)))
    let pattern = APTuple l (map pattern clauses)
    let guard = foldl (\acc, clause => guard clause `guardAnd` acc) Nothing clauses
    let body = AEFunCall l wrappedFun (map body clauses)
    pure $ MkMatcherClause pattern guard body (concatMap preComputedValues clauses)
  readErlMatcher l (MTaggedTuple tag args fun) = do
    let pattern = APTuple l (APLiteral (ALAtom l tag) :: map (APVar l . show) args)
    let guard = neutral
    body <- genErlExpr fun
    pure $ MkMatcherClause pattern guard body []
  readErlMatcher l (MMapSubset matchers fun) = do
    erlMatchers <- readErlMapEntryMatchers l matchers
    let args = map fst erlMatchers
    let clauses = map snd erlMatchers
    let varNames = varsToVarNames args
    let wrappedFun = AEFun l (length args) (singleton $ MkFunClause l (map (APVar l) varNames) [] (singleton !(genErlExpr fun)))
    let pattern = APMap l (map (\(keyVar, clause) => MkExact l (APVar l (show keyVar)) (pattern clause)) erlMatchers)
    let guard = foldl (\acc, (keyVar, clause) => guard clause `guardAnd` acc) Nothing erlMatchers
    let body = AEFunCall l wrappedFun (map (\(keyVar, clause) => body clause) erlMatchers)
    pure $ MkMatcherClause pattern guard body (concatMap preComputedValues clauses)
  readErlMatcher l (MFun arity) = do
    localVar <- newLocalVar
    let pattern = APVar l (show localVar)
    let guard = Just $ AGFunCall l "is_function" [AGVar l (show localVar), AGLiteral (ALInteger l (cast arity))]
    let body = AEVar l (show localVar)
    pure $ MkMatcherClause pattern guard body []
  readErlMatcher l (MTransform x xVar fun) = do
    xClause <- readErlMatcher l x
    let pattern = pattern xClause
    let guard = guard xClause
    let funClause = MkFunClause l [APVar l (show xVar)] [] (singleton !(genErlExpr fun))
    let body = AEFunCall l (AEFun l 1 (singleton funClause)) [body xClause]
    pure $ MkMatcherClause pattern guard body (preComputedValues xClause)
  readErlMatcher l (MConst x body) = do
    xClause <- readErlMatcher l x
    let pattern = pattern xClause
    let guard = guard xClause
    let body = !(genErlExpr body)
    pure $ MkMatcherClause pattern guard body (preComputedValues xClause)

  readSimpleGuardMatcherClause : Line -> (fnName : String) -> State LocalVars MatcherClause
  readSimpleGuardMatcherClause l fnName = do
    localVar <- newLocalVar
    let pattern = APVar l (show localVar)
    let guard = Just $ AGFunCall l fnName [AGVar l (show localVar)]
    let body = AEVar l (show localVar)
    pure $ MkMatcherClause pattern guard body []

  readErlMatchers : Line -> List (LocalVar, ErlMatcher) -> State LocalVars (List (LocalVar, MatcherClause))
  readErlMatchers l [] = pure []
  readErlMatchers l ((matcherVar, matcher) :: xs) = do
    xClause <- readErlMatcher l matcher
    xsClauses <- readErlMatchers l xs
    pure ((matcherVar, xClause) :: xsClauses)

  readErlMapEntryMatchers : Line -> List (LocalVar, ErlExpr, ErlMatcher) -> State LocalVars (List (LocalVar, MatcherClause))
  readErlMapEntryMatchers l [] = pure []
  readErlMapEntryMatchers l ((matcherVar, key, matcher) :: xs) = do
    keyVar <- newLocalVar
    keyValue <- genErlExpr key
    xClause <- readErlMatcher l matcher
    let xClause' = record { preComputedValues $= ((keyVar, keyValue) ::) } xClause
    xsClauses <- readErlMapEntryMatchers l xs
    pure ((matcherVar, xClause') :: xsClauses)

genCompileAttr : Line -> PrimTerm -> Decl
genCompileAttr l primTerm = ADAttribute l "compile" primTerm

genAttribute : ErlAttribute -> Decl
genAttribute (NoAutoImport l) = genCompileAttr l (PAtom "no_auto_import")
genAttribute (Inline l) = genCompileAttr l (PAtom "inline")
genAttribute (InlineSize l size) = genCompileAttr l (PTuple [PAtom "inline_size", PInteger (cast size)])

export
genErlModule : Line -> ErlModule -> List Decl
genErlModule exportsLine mod =
  -- NOTE: The order of declarations are important!
  genModuleName (name mod) :: map genAttribute (attributes mod) ++ [genExports (funDecls mod)] ++ map genFunDef (funDecls mod)
  where
    genModuleName : ErlModuleName -> Decl
    genModuleName (MkModuleName l name) = ADModule l name
    genExports : List ErlFunDecl -> Decl
    genExports funDecls =
      let exports = mapMaybe (\(MkFunDecl l visibility name args body) => if visibility == Public then Just (name, length args) else Nothing) funDecls
      in ADExport exportsLine exports
    genFunDef : ErlFunDecl -> Decl
    genFunDef (MkFunDecl l visibility name args body) =
      let varNames = varsToVarNames args
          expr = evalState (initLocalVars "E") (genErlExpr body)
      in ADFunDef l name (length args) (singleton $ MkFunClause l (map (APVar l) varNames) [] (singleton expr))
