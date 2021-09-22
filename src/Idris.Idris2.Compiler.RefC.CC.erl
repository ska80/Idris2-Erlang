-module('Idris.Idris2.Compiler.RefC.CC').
-compile('no_auto_import').
-compile('inline').
-compile({'inline_size',24}).
-export([
  'nested--6069-5482--in--un--clibdirs'/5,
  'un--fullprefix_dir'/2,
  'un--findCC'/1,
  'un--compileCObjectFile'/5,
  'un--compileCFile'/5
]).
'nested--6069-5482--in--un--clibdirs'(V0, V1, V2, V3, V4) -> ('Idris.Idris2.Prelude.Interfaces':'un--concat'({'Idris.Builtin.MkPair', {'Idris.Prelude.Interfaces.MkFoldable', fun (V5) -> fun (V6) -> fun (V7) -> fun (V8) -> fun (V9) -> ('Idris.Idris2.Prelude.Types':'dn--un--foldr_Foldable_List'(V7, V8, V9)) end end end end end, fun (V10) -> fun (V11) -> fun (V12) -> fun (V13) -> fun (V14) -> ('Idris.Idris2.Prelude.Types':'dn--un--foldl_Foldable_List'(V12, V13, V14)) end end end end end, fun (V15) -> fun (V16) -> ('Idris.Idris2.Prelude.Types':'dn--un--null_Foldable_List'(V16)) end end, fun (V17) -> fun (V18) -> fun (V19) -> fun (V20) -> fun (V21) -> fun (V22) -> fun (V23) -> ('Idris.Idris2.Prelude.Types':'dn--un--foldlM_Foldable_List'(V20, V21, V22, V23)) end end end end end end end, fun (V24) -> fun (V25) -> ('Idris.Idris2.Prelude.Types':'dn--un--toList_Foldable_List'(V25)) end end, fun (V26) -> fun (V27) -> fun (V28) -> fun (V29) -> fun (V30) -> ('Idris.Idris2.Prelude.Types':'dn--un--foldMap_Foldable_List'(V28, V29, V30)) end end end end end}, {'Idris.Prelude.Interfaces.MkMonoid', fun (V31) -> fun (V32) -> ('Idris.Idris2.Prelude.Types':'dn--un--<+>_Semigroup_String'(V31, V32)) end end, ('Idris.Idris2.Prelude.Types':'dn--un--neutral_Monoid_String'())}}, ('Idris.Idris2.Prelude.Types':'dn--un--map_Functor_List'(fun (V33) -> ('Idris.Idris2.Prelude.Types.String':'un--++'(<<"-L"/utf8>>, ('Idris.Idris2.Prelude.Types.String':'un--++'(V33, <<" "/utf8>>)))) end, V4)))).
'un--fullprefix_dir'(V0, V1) -> ('Idris.Idris2.Libraries.Utils.Path':'un--</>'(case V0 of {'Idris.Core.Options.MkDirs', E0, E1, E2, E3, E4, E5, E6, E7, E8, E9} -> (fun (V2, V3, V4, V5, V6, V7, V8, V9, V10, V11) -> V7 end(E0, E1, E2, E3, E4, E5, E6, E7, E8, E9)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end, ('Idris.Idris2.Libraries.Utils.Path':'un--</>'(('Idris.Idris2.Prelude.Types.String':'un--++'(<<"idris2-"/utf8>>, ('Idris.Idris2.Libraries.Data.Version':'un--showVersion'(0, ('Idris.Idris2.Idris.Version':'un--version'()))))), V1)))).
'un--findCC'(V0) -> begin (V28 = (('Idris.Idris2.Erlang.System':'un--getEnv'({'Idris.Prelude.IO.MkHasIO', {'Idris.Prelude.Interfaces.MkMonad', {'Idris.Prelude.Interfaces.MkApplicative', fun (V1) -> fun (V2) -> fun (V3) -> fun (V4) -> fun (V5) -> ('Idris.Idris2.Prelude.IO':'dn--un--map_Functor_IO'(V3, V4, V5)) end end end end end, fun (V6) -> fun (V7) -> fun (V8) -> V7 end end end, fun (V9) -> fun (V10) -> fun (V11) -> fun (V12) -> fun (V13) -> begin (V14 = (V11(V13))), begin (V15 = (V12(V13))), (V14(V15)) end end end end end end end}, fun (V16) -> fun (V17) -> fun (V18) -> fun (V19) -> fun (V20) -> begin (V21 = (V18(V20))), ((V19(V21))(V20)) end end end end end end, fun (V22) -> fun (V23) -> fun (V24) -> begin (V25 = (V23(V24))), (V25(V24)) end end end end}, fun (V26) -> fun (V27) -> V27 end end}, <<"IDRIS2_CC"/utf8>>))(V0))), case V28 of {'Idris.Prelude.Types.Nothing'} -> (fun () -> begin (V56 = (('Idris.Idris2.Erlang.System':'un--getEnv'({'Idris.Prelude.IO.MkHasIO', {'Idris.Prelude.Interfaces.MkMonad', {'Idris.Prelude.Interfaces.MkApplicative', fun (V29) -> fun (V30) -> fun (V31) -> fun (V32) -> fun (V33) -> ('Idris.Idris2.Prelude.IO':'dn--un--map_Functor_IO'(V31, V32, V33)) end end end end end, fun (V34) -> fun (V35) -> fun (V36) -> V35 end end end, fun (V37) -> fun (V38) -> fun (V39) -> fun (V40) -> fun (V41) -> begin (V42 = (V39(V41))), begin (V43 = (V40(V41))), (V42(V43)) end end end end end end end}, fun (V44) -> fun (V45) -> fun (V46) -> fun (V47) -> fun (V48) -> begin (V49 = (V46(V48))), ((V47(V49))(V48)) end end end end end end, fun (V50) -> fun (V51) -> fun (V52) -> begin (V53 = (V51(V52))), (V53(V52)) end end end end}, fun (V54) -> fun (V55) -> V55 end end}, <<"CC"/utf8>>))(V0))), case V56 of {'Idris.Prelude.Types.Nothing'} -> (fun () -> <<"cc"/utf8>> end()); {'Idris.Prelude.Types.Just', E0} -> (fun (V57) -> V57 end(E0)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end()); {'Idris.Prelude.Types.Just', E1} -> (fun (V58) -> V58 end(E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end.
'un--compileCObjectFile'(V0, V1, V2, V3, V4) -> begin (V6 = begin (V5 = ('un--findCC'(V4))), {'Idris.Prelude.Types.Right', V5} end), case V6 of {'Idris.Prelude.Types.Left', E0} -> (fun (V7) -> {'Idris.Prelude.Types.Left', V7} end(E0)); {'Idris.Prelude.Types.Right', E1} -> (fun (V8) -> begin (V9 = ('Idris.Idris2.Core.Context':'un--getDirs'(V0, V4))), case V9 of {'Idris.Prelude.Types.Left', E2} -> (fun (V10) -> {'Idris.Prelude.Types.Left', V10} end(E2)); {'Idris.Prelude.Types.Right', E3} -> (fun (V11) -> begin (V12 = case V1 of 1 -> <<"-fpic "/utf8>>; 0 -> <<""/utf8>>; _ -> ('erlang':'throw'("Error: Unreachable branch")) end), begin (V13 = ('Idris.Idris2.Prelude.Types.String':'un--++'(V8, ('Idris.Idris2.Prelude.Types.String':'un--++'(<<" -Werror -c "/utf8>>, ('Idris.Idris2.Prelude.Types.String':'un--++'(V12, ('Idris.Idris2.Prelude.Types.String':'un--++'(V2, ('Idris.Idris2.Prelude.Types.String':'un--++'(<<" -o "/utf8>>, ('Idris.Idris2.Prelude.Types.String':'un--++'(V3, ('Idris.Idris2.Prelude.Types.String':'un--++'(<<" "/utf8>>, ('Idris.Idris2.Prelude.Types.String':'un--++'(<<"-I"/utf8>>, ('Idris.Idris2.Prelude.Types.String':'un--++'(('un--fullprefix_dir'(V11, <<"refc "/utf8>>)), ('Idris.Idris2.Prelude.Types.String':'un--++'(<<"-I"/utf8>>, ('un--fullprefix_dir'(V11, <<"include"/utf8>>))))))))))))))))))))))), begin (V14 = ('Idris.Idris2.Core.Context.Log':'un--log'(V0, <<"compiler.refc.cc"/utf8>>, (1 + (1 + (1 + (1 + (1 + (1 + (1 + (1 + (1 + (1 + 0)))))))))), fun () -> V13 end, V4))), case V14 of {'Idris.Prelude.Types.Left', E4} -> (fun (V15) -> {'Idris.Prelude.Types.Left', V15} end(E4)); {'Idris.Prelude.Types.Right', E5} -> (fun (V16) -> begin (V45 = begin (V44 = (('Idris.Idris2.Erlang.System':'un--system'({'Idris.Prelude.IO.MkHasIO', {'Idris.Prelude.Interfaces.MkMonad', {'Idris.Prelude.Interfaces.MkApplicative', fun (V17) -> fun (V18) -> fun (V19) -> fun (V20) -> fun (V21) -> ('Idris.Idris2.Prelude.IO':'dn--un--map_Functor_IO'(V19, V20, V21)) end end end end end, fun (V22) -> fun (V23) -> fun (V24) -> V23 end end end, fun (V25) -> fun (V26) -> fun (V27) -> fun (V28) -> fun (V29) -> begin (V30 = (V27(V29))), begin (V31 = (V28(V29))), (V30(V31)) end end end end end end end}, fun (V32) -> fun (V33) -> fun (V34) -> fun (V35) -> fun (V36) -> begin (V37 = (V34(V36))), ((V35(V37))(V36)) end end end end end end, fun (V38) -> fun (V39) -> fun (V40) -> begin (V41 = (V39(V40))), (V41(V40)) end end end end}, fun (V42) -> fun (V43) -> V43 end end}, V13))(V4))), {'Idris.Prelude.Types.Right', V44} end), case V45 of {'Idris.Prelude.Types.Left', E6} -> (fun (V46) -> {'Idris.Prelude.Types.Left', V46} end(E6)); {'Idris.Prelude.Types.Right', E7} -> (fun (V47) -> case V47 of 0 -> {'Idris.Prelude.Types.Right', {'Idris.Prelude.Types.Just', V3}}; _ -> {'Idris.Prelude.Types.Right', {'Idris.Prelude.Types.Nothing'}} end end(E7)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E5)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end end end(E3)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end.
'un--compileCFile'(V0, V1, V2, V3, V4) -> begin (V6 = begin (V5 = ('un--findCC'(V4))), {'Idris.Prelude.Types.Right', V5} end), case V6 of {'Idris.Prelude.Types.Left', E0} -> (fun (V7) -> {'Idris.Prelude.Types.Left', V7} end(E0)); {'Idris.Prelude.Types.Right', E1} -> (fun (V8) -> begin (V9 = ('Idris.Idris2.Core.Context':'un--getDirs'(V0, V4))), case V9 of {'Idris.Prelude.Types.Left', E2} -> (fun (V10) -> {'Idris.Prelude.Types.Left', V10} end(E2)); {'Idris.Prelude.Types.Right', E3} -> (fun (V11) -> begin (V12 = case V1 of 1 -> <<"-shared "/utf8>>; 0 -> <<""/utf8>>; _ -> ('erlang':'throw'("Error: Unreachable branch")) end), begin (V23 = ('Idris.Idris2.Prelude.Types.String':'un--++'(V8, ('Idris.Idris2.Prelude.Types.String':'un--++'(<<" -Werror "/utf8>>, ('Idris.Idris2.Prelude.Types.String':'un--++'(V12, ('Idris.Idris2.Prelude.Types.String':'un--++'(V2, ('Idris.Idris2.Prelude.Types.String':'un--++'(<<" -o "/utf8>>, ('Idris.Idris2.Prelude.Types.String':'un--++'(V3, ('Idris.Idris2.Prelude.Types.String':'un--++'(<<" "/utf8>>, ('Idris.Idris2.Prelude.Types.String':'un--++'(('Idris.Idris2.Libraries.Utils.Path':'un--</>'(('un--fullprefix_dir'(V11, <<"lib"/utf8>>)), <<"libidris2_support.a"/utf8>>)), ('Idris.Idris2.Prelude.Types.String':'un--++'(<<" "/utf8>>, ('Idris.Idris2.Prelude.Types.String':'un--++'(<<"-lidris2_refc "/utf8>>, ('Idris.Idris2.Prelude.Types.String':'un--++'(<<"-L"/utf8>>, ('Idris.Idris2.Prelude.Types.String':'un--++'(('un--fullprefix_dir'(V11, <<"refc "/utf8>>)), ('Idris.Idris2.Prelude.Types.String':'un--++'(('nested--6069-5482--in--un--clibdirs'(V3, V2, V1, V0, case V11 of {'Idris.Core.Options.MkDirs', E4, E5, E6, E7, E8, E9, E10, E11, E12, E13} -> (fun (V13, V14, V15, V16, V17, V18, V19, V20, V21, V22) -> V21 end(E4, E5, E6, E7, E8, E9, E10, E11, E12, E13)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end)), <<"-lgmp -lm"/utf8>>))))))))))))))))))))))))))), begin (V24 = ('Idris.Idris2.Core.Context.Log':'un--log'(V0, <<"compiler.refc.cc"/utf8>>, (1 + (1 + (1 + (1 + (1 + (1 + (1 + (1 + (1 + (1 + 0)))))))))), fun () -> V23 end, V4))), case V24 of {'Idris.Prelude.Types.Left', E14} -> (fun (V25) -> {'Idris.Prelude.Types.Left', V25} end(E14)); {'Idris.Prelude.Types.Right', E15} -> (fun (V26) -> begin (V55 = begin (V54 = (('Idris.Idris2.Erlang.System':'un--system'({'Idris.Prelude.IO.MkHasIO', {'Idris.Prelude.Interfaces.MkMonad', {'Idris.Prelude.Interfaces.MkApplicative', fun (V27) -> fun (V28) -> fun (V29) -> fun (V30) -> fun (V31) -> ('Idris.Idris2.Prelude.IO':'dn--un--map_Functor_IO'(V29, V30, V31)) end end end end end, fun (V32) -> fun (V33) -> fun (V34) -> V33 end end end, fun (V35) -> fun (V36) -> fun (V37) -> fun (V38) -> fun (V39) -> begin (V40 = (V37(V39))), begin (V41 = (V38(V39))), (V40(V41)) end end end end end end end}, fun (V42) -> fun (V43) -> fun (V44) -> fun (V45) -> fun (V46) -> begin (V47 = (V44(V46))), ((V45(V47))(V46)) end end end end end end, fun (V48) -> fun (V49) -> fun (V50) -> begin (V51 = (V49(V50))), (V51(V50)) end end end end}, fun (V52) -> fun (V53) -> V53 end end}, V23))(V4))), {'Idris.Prelude.Types.Right', V54} end), case V55 of {'Idris.Prelude.Types.Left', E16} -> (fun (V56) -> {'Idris.Prelude.Types.Left', V56} end(E16)); {'Idris.Prelude.Types.Right', E17} -> (fun (V57) -> case V57 of 0 -> {'Idris.Prelude.Types.Right', {'Idris.Prelude.Types.Just', V3}}; _ -> {'Idris.Prelude.Types.Right', {'Idris.Prelude.Types.Nothing'}} end end(E17)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E15)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end end end(E3)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end.
