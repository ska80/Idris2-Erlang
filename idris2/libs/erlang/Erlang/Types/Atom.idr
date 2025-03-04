module Erlang.Types.Atom

import Language.Reflection

%default total


||| Generate atom functions from a list of strings.
|||
||| Usage:
||| ```
||| import Erlang
||| import Language.Reflection
|||
||| %language ElabReflection
|||
||| %runElab generateAtomHelpers ["ok", "error"]
||| ```
|||
||| Will generate the following functions:
||| ```
||| private %inline
||| A_ok : ErlAtom
||| A_ok = MkAtom "ok"
|||
||| private %inline
||| A_error : ErlAtom
||| A_error = MkAtom "error"
||| ```
export
generateAtomHelpers : List String -> Elab ()
generateAtomHelpers atoms =
  declare (atoms >>= atomToDecls)
  where
    atomToDecls : String -> List Decl
    atomToDecls atom =
      let fnName = UN (Basic ("A_" ++ atom))
      in
        [ IClaim EmptyFC MW Private [Inline] (MkTy EmptyFC EmptyFC fnName `(ErlAtom))
        , IDef EmptyFC fnName
            [ PatClause EmptyFC
                (IVar EmptyFC fnName)
                `(MkAtom ~(IPrimVal EmptyFC (Str atom)))
            ]
        ]
