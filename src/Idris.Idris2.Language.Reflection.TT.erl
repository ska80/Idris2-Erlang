-module('Idris.Idris2.Language.Reflection.TT').
-compile('no_auto_import').
-compile('inline').
-compile({'inline_size',24}).
-export([
  'dn--un--show_Show_UserName'/1,
  'dn--un--show_Show_Namespace'/1,
  'dn--un--show_Show_Name'/1,
  'dn--un--showPrec_Show_UserName'/2,
  'dn--un--showPrec_Show_Namespace'/2,
  'dn--un--showPrec_Show_Name'/2,
  'dn--un--__Impl_Show_UserName'/0,
  'dn--un--__Impl_Show_Namespace'/0,
  'dn--un--__Impl_Show_Name'/0,
  'un--showSep'/2,
  'un--emptyFC'/0,
  'un--FilePos'/0
]).
'dn--un--show_Show_UserName'(V0) -> case V0 of {'Idris.Language.Reflection.TT.Basic', E0} -> (fun (V1) -> V1 end(E0)); {'Idris.Language.Reflection.TT.Field', E1} -> (fun (V2) -> ('Idris.Idris2.Prelude.Types.String':'un--++'(<<"."/utf8>>, V2)) end(E1)); {'Idris.Language.Reflection.TT.Underscore'} -> (fun () -> <<"_"/utf8>> end()); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'dn--un--show_Show_Namespace'(V0) -> ('un--showSep'(<<"."/utf8>>, ('Idris.Idris2.Prelude.Types.List':'un--reverse'(V0)))).
'dn--un--show_Show_Name'(V0) -> case V0 of {'Idris.Language.Reflection.TT.NS', E0, E1} -> (fun (V1, V2) -> ('Idris.Idris2.Prelude.Types.String':'un--++'(('dn--un--show_Show_Namespace'(V1)), ('Idris.Idris2.Prelude.Types.String':'un--++'(<<"."/utf8>>, ('dn--un--show_Show_Name'(V2)))))) end(E0, E1)); {'Idris.Language.Reflection.TT.UN', E2} -> (fun (V3) -> ('dn--un--show_Show_UserName'(V3)) end(E2)); {'Idris.Language.Reflection.TT.MN', E3, E4} -> (fun (V4, V5) -> ('Idris.Idris2.Prelude.Types.String':'un--++'(<<"{"/utf8>>, ('Idris.Idris2.Prelude.Types.String':'un--++'(V4, ('Idris.Idris2.Prelude.Types.String':'un--++'(<<":"/utf8>>, ('Idris.Idris2.Prelude.Types.String':'un--++'(('Idris.Idris2.Prelude.Show':'dn--un--show_Show_Int'(V5)), <<"}"/utf8>>)))))))) end(E3, E4)); {'Idris.Language.Reflection.TT.DN', E5, E6} -> (fun (V6, V7) -> V6 end(E5, E6)); {'Idris.Language.Reflection.TT.Nested', E7, E8} -> (fun (V8, V9) -> case V8 of {'Idris.Builtin.MkPair', E9, E10} -> (fun (V10, V11) -> ('Idris.Idris2.Prelude.Types.String':'un--++'(('Idris.Idris2.Prelude.Show':'dn--un--show_Show_Int'(V10)), ('Idris.Idris2.Prelude.Types.String':'un--++'(<<":"/utf8>>, ('Idris.Idris2.Prelude.Types.String':'un--++'(('Idris.Idris2.Prelude.Show':'dn--un--show_Show_Int'(V11)), ('Idris.Idris2.Prelude.Types.String':'un--++'(<<":"/utf8>>, ('dn--un--show_Show_Name'(V9)))))))))) end(E9, E10)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E7, E8)); {'Idris.Language.Reflection.TT.CaseBlock', E11, E12} -> (fun (V12, V13) -> ('Idris.Idris2.Prelude.Types.String':'un--++'(<<"case block in "/utf8>>, ('Idris.Idris2.Prelude.Show':'dn--un--show_Show_String'(V12)))) end(E11, E12)); {'Idris.Language.Reflection.TT.WithBlock', E13, E14} -> (fun (V14, V15) -> ('Idris.Idris2.Prelude.Types.String':'un--++'(<<"with block in "/utf8>>, ('Idris.Idris2.Prelude.Show':'dn--un--show_Show_String'(V14)))) end(E13, E14)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'dn--un--showPrec_Show_UserName'(V0, V1) -> ('dn--un--show_Show_UserName'(V1)).
'dn--un--showPrec_Show_Namespace'(V0, V1) -> ('dn--un--show_Show_Namespace'(V1)).
'dn--un--showPrec_Show_Name'(V0, V1) -> ('dn--un--show_Show_Name'(V1)).
'dn--un--__Impl_Show_UserName'() -> {'Idris.Prelude.Show.MkShow', fun (V0) -> ('dn--un--show_Show_UserName'(V0)) end, fun (V1) -> fun (V2) -> ('dn--un--showPrec_Show_UserName'(V1, V2)) end end}.
'dn--un--__Impl_Show_Namespace'() -> {'Idris.Prelude.Show.MkShow', fun (V0) -> ('dn--un--show_Show_Namespace'(V0)) end, fun (V1) -> fun (V2) -> ('dn--un--showPrec_Show_Namespace'(V1, V2)) end end}.
'dn--un--__Impl_Show_Name'() -> {'Idris.Prelude.Show.MkShow', fun (V0) -> ('dn--un--show_Show_Name'(V0)) end, fun (V1) -> fun (V2) -> ('dn--un--showPrec_Show_Name'(V1, V2)) end end}.
'un--showSep'(V0, V1) -> case V1 of [] -> <<""/utf8>>; [E0 | E1] -> (fun (V2, V3) -> case V3 of [] -> V2; _ -> ('Idris.Idris2.Prelude.Types.String':'un--++'(V2, ('Idris.Idris2.Prelude.Types.String':'un--++'(V0, ('un--showSep'(V0, V3)))))) end end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--emptyFC'() -> {'Idris.Language.Reflection.TT.EmptyFC'}.
'un--FilePos'() -> {'Idris.Builtin.Pair', {'Idris.Int'}, {'Idris.Int'}}.
