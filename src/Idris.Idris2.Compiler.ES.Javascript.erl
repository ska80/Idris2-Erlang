-module('Idris.Idris2.Compiler.ES.Javascript').
-compile('no_auto_import').
-compile('inline').
-compile({'inline_size',24}).
-export([
  'un--htmlHeader'/0,
  'un--htmlFooter'/0,
  'un--executeExpr'/4,
  'un--compileToJS'/3,
  'un--compileLibrary'/6,
  'un--compileExpr'/6,
  'un--codegenJavascript'/0,
  'un--addHeaderAndFooter'/2
]).
'un--htmlHeader'() -> ('Idris.Idris2.Prelude.Interfaces':'un--concat'({'Idris.Builtin.MkPair', {'Idris.Prelude.Interfaces.MkFoldable', fun (V0) -> fun (V1) -> fun (V2) -> fun (V3) -> fun (V4) -> ('Idris.Idris2.Prelude.Types':'dn--un--foldr_Foldable_List'(V2, V3, V4)) end end end end end, fun (V5) -> fun (V6) -> fun (V7) -> fun (V8) -> fun (V9) -> ('Idris.Idris2.Prelude.Types':'dn--un--foldl_Foldable_List'(V7, V8, V9)) end end end end end, fun (V10) -> fun (V11) -> ('Idris.Idris2.Prelude.Types':'dn--un--null_Foldable_List'(V11)) end end, fun (V12) -> fun (V13) -> fun (V14) -> fun (V15) -> fun (V16) -> fun (V17) -> fun (V18) -> ('Idris.Idris2.Prelude.Types':'dn--un--foldlM_Foldable_List'(V15, V16, V17, V18)) end end end end end end end, fun (V19) -> fun (V20) -> ('Idris.Idris2.Prelude.Types':'dn--un--toList_Foldable_List'(V20)) end end, fun (V21) -> fun (V22) -> fun (V23) -> fun (V24) -> fun (V25) -> ('Idris.Idris2.Prelude.Types':'dn--un--foldMap_Foldable_List'(V23, V24, V25)) end end end end end}, {'Idris.Prelude.Interfaces.MkMonoid', fun (V26) -> fun (V27) -> ('Idris.Idris2.Prelude.Types':'dn--un--<+>_Semigroup_String'(V26, V27)) end end, ('Idris.Idris2.Prelude.Types':'dn--un--neutral_Monoid_String'())}}, [<<"<html>\x{a}"/utf8>> | [<<" <head>\x{a}"/utf8>> | [<<"  <meta charset=\x{27}utf-8\x{27}>\x{a}"/utf8>> | [<<" </head>\x{a}"/utf8>> | [<<" <body>\x{a}"/utf8>> | [<<"  <script type=\x{27}text/javascript\x{27}>\x{a}"/utf8>> | []]]]]]])).
'un--htmlFooter'() -> ('Idris.Idris2.Prelude.Interfaces':'un--concat'({'Idris.Builtin.MkPair', {'Idris.Prelude.Interfaces.MkFoldable', fun (V0) -> fun (V1) -> fun (V2) -> fun (V3) -> fun (V4) -> ('Idris.Idris2.Prelude.Types':'dn--un--foldr_Foldable_List'(V2, V3, V4)) end end end end end, fun (V5) -> fun (V6) -> fun (V7) -> fun (V8) -> fun (V9) -> ('Idris.Idris2.Prelude.Types':'dn--un--foldl_Foldable_List'(V7, V8, V9)) end end end end end, fun (V10) -> fun (V11) -> ('Idris.Idris2.Prelude.Types':'dn--un--null_Foldable_List'(V11)) end end, fun (V12) -> fun (V13) -> fun (V14) -> fun (V15) -> fun (V16) -> fun (V17) -> fun (V18) -> ('Idris.Idris2.Prelude.Types':'dn--un--foldlM_Foldable_List'(V15, V16, V17, V18)) end end end end end end end, fun (V19) -> fun (V20) -> ('Idris.Idris2.Prelude.Types':'dn--un--toList_Foldable_List'(V20)) end end, fun (V21) -> fun (V22) -> fun (V23) -> fun (V24) -> fun (V25) -> ('Idris.Idris2.Prelude.Types':'dn--un--foldMap_Foldable_List'(V23, V24, V25)) end end end end end}, {'Idris.Prelude.Interfaces.MkMonoid', fun (V26) -> fun (V27) -> ('Idris.Idris2.Prelude.Types':'dn--un--<+>_Semigroup_String'(V26, V27)) end end, ('Idris.Idris2.Prelude.Types':'dn--un--neutral_Monoid_String'())}}, [<<"\x{a}  </script>\x{a}"/utf8>> | [<<" </body>\x{a}"/utf8>> | [<<"</html>"/utf8>> | []]]])).
'un--executeExpr'(V0, V1, V2, V3) -> ('Idris.Idris2.Core.Core':'dn--un--throw_Catchable_Core_Error'({'Idris.Core.Core.InternalError', <<"Javascript backend is only able to compile, use Node instead"/utf8>>}, V3)).
'un--compileToJS'(V0, V1, V2) -> ('Idris.Idris2.Compiler.ES.Codegen':'un--compileToES'(V0, {'Idris.Core.Options.Javascript'}, V1, [<<"browser"/utf8>> | [<<"javascript"/utf8>> | []]], V2)).
'un--compileLibrary'(V0, V1, V2, V3, V4, V5) -> begin (V34 = begin (V33 = (('Idris.Idris2.Prelude.IO':'un--putStrLn'({'Idris.Prelude.IO.MkHasIO', {'Idris.Prelude.Interfaces.MkMonad', {'Idris.Prelude.Interfaces.MkApplicative', fun (V6) -> fun (V7) -> fun (V8) -> fun (V9) -> fun (V10) -> ('Idris.Idris2.Prelude.IO':'dn--un--map_Functor_IO'(V8, V9, V10)) end end end end end, fun (V11) -> fun (V12) -> fun (V13) -> V12 end end end, fun (V14) -> fun (V15) -> fun (V16) -> fun (V17) -> fun (V18) -> begin (V19 = (V16(V18))), begin (V20 = (V17(V18))), (V19(V20)) end end end end end end end}, fun (V21) -> fun (V22) -> fun (V23) -> fun (V24) -> fun (V25) -> begin (V26 = (V23(V25))), ((V24(V26))(V25)) end end end end end end, fun (V27) -> fun (V28) -> fun (V29) -> begin (V30 = (V28(V29))), (V30(V29)) end end end end}, fun (V31) -> fun (V32) -> V32 end end}, <<"Compiling to library is not supported."/utf8>>))(V5))), {'Idris.Prelude.Types.Right', V33} end), case V34 of {'Idris.Prelude.Types.Left', E0} -> (fun (V35) -> {'Idris.Prelude.Types.Left', V35} end(E0)); {'Idris.Prelude.Types.Right', E1} -> (fun (V36) -> {'Idris.Prelude.Types.Right', {'Idris.Prelude.Types.Nothing'}} end(E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end.
'un--compileExpr'(V0, V1, V2, V3, V4, V5) -> begin (V6 = ('un--compileToJS'(V0, V3, V5))), case V6 of {'Idris.Prelude.Types.Left', E0} -> (fun (V7) -> {'Idris.Prelude.Types.Left', V7} end(E0)); {'Idris.Prelude.Types.Right', E1} -> (fun (V8) -> begin (V9 = ('un--addHeaderAndFooter'(V4, V8))), begin (V10 = ('Idris.Idris2.Libraries.Utils.Path':'un--</>'(V2, V4))), begin (V11 = ('Idris.Idris2.Core.Core':'un--writeFile'(V10, V9, V5))), case V11 of {'Idris.Prelude.Types.Left', E2} -> (fun (V12) -> {'Idris.Prelude.Types.Left', V12} end(E2)); {'Idris.Prelude.Types.Right', E3} -> (fun (V13) -> {'Idris.Prelude.Types.Right', {'Idris.Prelude.Types.Just', V10}} end(E3)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end end end(E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end.
'un--codegenJavascript'() -> {'Idris.Compiler.Common.MkCG', fun (V0) -> fun (V1) -> fun (V2) -> fun (V3) -> fun (V4) -> fun (V5) -> ('un--compileExpr'(V0, V1, V2, V3, V4, V5)) end end end end end end, fun (V6) -> fun (V7) -> fun (V8) -> fun (V9) -> ('un--executeExpr'(V6, V7, V8, V9)) end end end end, fun (V10) -> fun (V11) -> fun (V12) -> fun (V13) -> fun (V14) -> fun (V15) -> ('un--compileLibrary'(V10, V11, V12, V13, V14, V15)) end end end end end end, {'Idris.Prelude.Types.Nothing'}, {'Idris.Prelude.Types.Nothing'}}.
'un--addHeaderAndFooter'(V0, V1) -> case ('Idris.Idris2.Prelude.Interfaces':'un--<$>'(fun (V2) -> fun (V3) -> fun (V4) -> fun (V5) -> ('Idris.Idris2.Prelude.Types':'dn--un--map_Functor_Maybe'(V4, V5)) end end end end, fun (V6) -> ('Idris.Idris2.Data.String':'un--toLower'(V6)) end, ('Idris.Idris2.Libraries.Utils.Path':'un--extension'(V0)))) of {'Idris.Prelude.Types.Just', E0} -> (fun (V7) -> case V7 of <<"html"/utf8>> -> ('Idris.Idris2.Prelude.Types.String':'un--++'(('un--htmlHeader'()), ('Idris.Idris2.Prelude.Types.String':'un--++'(V1, ('un--htmlFooter'()))))); _ -> V1 end end(E0)); _ -> V1 end.
