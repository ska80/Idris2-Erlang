-module('Idris.Idris2.Erlang.System').
-compile('no_auto_import').
-compile('inline').
-compile({'inline_size',24}).
-export([
  'case--getEnvironment,splitEq-1600'/3,
  'nested--3565-1587--in--un--splitEq'/2,
  'un--unsetEnv'/2,
  'un--time'/1,
  'un--system'/2,
  'un--sleep'/2,
  'un--setEnv'/4,
  'un--halt'/2,
  'un--getEnvironment'/1,
  'un--getEnv'/2,
  'un--getArgs'/1,
  'un--exitWith'/2,
  'un--exitSuccess'/1,
  'un--exitFailure'/1
]).
'case--getEnvironment,splitEq-1600'(V0, V1, V2) -> case V2 of {'Idris.Builtin.MkPair', E0, E1} -> (fun (V3, V4) -> case ('Idris.Idris2.Data.String':'un--break'(fun (V5) -> ('Idris.Idris2.Prelude.EqOrd':'dn--un--/=_Eq_Char'(V5, $=)) end, V4)) of {'Idris.Builtin.MkPair', E2, E3} -> (fun (V6, V7) -> {'Idris.Builtin.MkPair', V3, V7} end(E2, E3)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'nested--3565-1587--in--un--splitEq'(V0, V1) -> ('case--getEnvironment,splitEq-1600'(V0, V1, ('Idris.Idris2.Data.String':'un--break'(fun (V2) -> ('Idris.Idris2.Prelude.EqOrd':'dn--un--==_Eq_Char'(V2, $=)) end, V1)))).
'un--unsetEnv'(V0, V1) -> case V0 of {'Idris.Prelude.IO.MkHasIO', E0, E1} -> (fun (V2, V3) -> case V2 of {'Idris.Prelude.Interfaces.MkMonad', E2, E3, E4} -> (fun (V4, V5, V6) -> ((((V5('erased'))('erased'))(case V0 of {'Idris.Prelude.IO.MkHasIO', E5, E6} -> (fun (V16, V17) -> case V16 of {'Idris.Prelude.Interfaces.MkMonad', E7, E8, E9} -> (fun (V18, V19, V20) -> case V18 of {'Idris.Prelude.Interfaces.MkApplicative', E10, E11, E12} -> (fun (V21, V22, V23) -> ((V22('erased'))(('erlang':'apply'('os', 'unsetenv', [('unicode':'characters_to_list'(V1)) | []])))) end(E10, E11, E12)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E7, E8, E9)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E5, E6)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end))(fun (V7) -> case V0 of {'Idris.Prelude.IO.MkHasIO', E13, E14} -> (fun (V8, V9) -> case V8 of {'Idris.Prelude.Interfaces.MkMonad', E15, E16, E17} -> (fun (V10, V11, V12) -> case V10 of {'Idris.Prelude.Interfaces.MkApplicative', E18, E19, E20} -> (fun (V13, V14, V15) -> ((V14('erased'))(1)) end(E18, E19, E20)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E15, E16, E17)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E13, E14)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end)) end(E2, E3, E4)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--time'(V0) -> case V0 of {'Idris.Prelude.IO.MkHasIO', E0, E1} -> (fun (V1, V2) -> case V1 of {'Idris.Prelude.Interfaces.MkMonad', E2, E3, E4} -> (fun (V3, V4, V5) -> ((((V4('erased'))('erased'))(case V0 of {'Idris.Prelude.IO.MkHasIO', E5, E6} -> (fun (V15, V16) -> case V15 of {'Idris.Prelude.Interfaces.MkMonad', E7, E8, E9} -> (fun (V17, V18, V19) -> case V17 of {'Idris.Prelude.Interfaces.MkApplicative', E10, E11, E12} -> (fun (V20, V21, V22) -> ((V21('erased'))(('erlang':'apply'('erlang', 'system_time', [])))) end(E10, E11, E12)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E7, E8, E9)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E5, E6)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end))(fun (V6) -> case V0 of {'Idris.Prelude.IO.MkHasIO', E13, E14} -> (fun (V7, V8) -> case V7 of {'Idris.Prelude.Interfaces.MkMonad', E15, E16, E17} -> (fun (V9, V10, V11) -> case V9 of {'Idris.Prelude.Interfaces.MkApplicative', E18, E19, E20} -> (fun (V12, V13, V14) -> ((V13('erased'))(('Idris.Idris2.Prelude.Num':'dn--un--div_Integral_Integer'(V6, 1000000000)))) end(E18, E19, E20)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E15, E16, E17)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E13, E14)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end)) end(E2, E3, E4)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--system'(V0, V1) -> case V0 of {'Idris.Prelude.IO.MkHasIO', E0, E1} -> (fun (V2, V3) -> case V2 of {'Idris.Prelude.Interfaces.MkMonad', E2, E3, E4} -> (fun (V4, V5, V6) -> ((((V5('erased'))('erased'))(case V0 of {'Idris.Prelude.IO.MkHasIO', E5, E6} -> (fun (V20, V21) -> case V20 of {'Idris.Prelude.Interfaces.MkMonad', E7, E8, E9} -> (fun (V22, V23, V24) -> case V22 of {'Idris.Prelude.Interfaces.MkApplicative', E10, E11, E12} -> (fun (V25, V26, V27) -> ((V26('erased'))(('erlang':'apply'('os', 'cmd', [('unicode':'characters_to_list'(V1)) | []])))) end(E10, E11, E12)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E7, E8, E9)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E5, E6)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end))(fun (V7) -> case V7 of E13 -> (fun (V8) -> ('Idris.Idris2.Prelude.Interfaces':'un-->>'(case V0 of {'Idris.Prelude.IO.MkHasIO', E14, E15} -> (fun (V9, V10) -> V9 end(E14, E15)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end, ('Idris.Idris2.Prelude.IO':'un--putStr'(V0, V8)), fun () -> case V0 of {'Idris.Prelude.IO.MkHasIO', E16, E17} -> (fun (V11, V12) -> case V11 of {'Idris.Prelude.Interfaces.MkMonad', E18, E19, E20} -> (fun (V13, V14, V15) -> case V13 of {'Idris.Prelude.Interfaces.MkApplicative', E21, E22, E23} -> (fun (V16, V17, V18) -> ((V17('erased'))(0)) end(E21, E22, E23)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E18, E19, E20)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E16, E17)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end)) end((fun (V19) -> ('unicode':'characters_to_binary'(V19)) end(E13)))); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end)) end(E2, E3, E4)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--sleep'(V0, V1) -> case V0 of {'Idris.Prelude.IO.MkHasIO', E0, E1} -> (fun (V2, V3) -> case V2 of {'Idris.Prelude.Interfaces.MkMonad', E2, E3, E4} -> (fun (V4, V5, V6) -> case V4 of {'Idris.Prelude.Interfaces.MkApplicative', E5, E6, E7} -> (fun (V7, V8, V9) -> ((((V7('erased'))('erased'))(fun (V18) -> 0 end))(case V0 of {'Idris.Prelude.IO.MkHasIO', E8, E9} -> (fun (V10, V11) -> case V10 of {'Idris.Prelude.Interfaces.MkMonad', E10, E11, E12} -> (fun (V12, V13, V14) -> case V12 of {'Idris.Prelude.Interfaces.MkApplicative', E13, E14, E15} -> (fun (V15, V16, V17) -> ((V16('erased'))(('erlang':'apply'('timer', 'sleep', [V1 | []])))) end(E13, E14, E15)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E10, E11, E12)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E8, E9)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end)) end(E5, E6, E7)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E2, E3, E4)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--setEnv'(V0, V1, V2, V3) -> case V0 of {'Idris.Prelude.IO.MkHasIO', E0, E1} -> (fun (V4, V5) -> case V4 of {'Idris.Prelude.Interfaces.MkMonad', E2, E3, E4} -> (fun (V6, V7, V8) -> ((((V7('erased'))('erased'))(case V3 of 1 -> case V0 of {'Idris.Prelude.IO.MkHasIO', E5, E6} -> (fun (V42, V43) -> case V42 of {'Idris.Prelude.Interfaces.MkMonad', E7, E8, E9} -> (fun (V44, V45, V46) -> case V44 of {'Idris.Prelude.Interfaces.MkApplicative', E10, E11, E12} -> (fun (V47, V48, V49) -> ((V48('erased'))(1)) end(E10, E11, E12)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E7, E8, E9)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E5, E6)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end; 0 -> ('Idris.Idris2.Prelude.Interfaces':'un--<$>'(case V0 of {'Idris.Prelude.IO.MkHasIO', E13, E14} -> (fun (V50, V51) -> case V50 of {'Idris.Prelude.Interfaces.MkMonad', E15, E16, E17} -> (fun (V52, V53, V54) -> case V52 of {'Idris.Prelude.Interfaces.MkApplicative', E18, E19, E20} -> (fun (V55, V56, V57) -> V55 end(E18, E19, E20)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E15, E16, E17)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E13, E14)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end, fun (V58) -> ('Idris.Idris2.Data.Maybe':'un--isNothing'(V58)) end, ('un--getEnv'(V0, V1)))); _ -> ('erlang':'throw'("Error: Unreachable branch")) end))(fun (V9) -> ('Idris.Idris2.Prelude.Interfaces':'un-->>'(case V0 of {'Idris.Prelude.IO.MkHasIO', E21, E22} -> (fun (V10, V11) -> V10 end(E21, E22)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end, ('Idris.Idris2.Prelude.Interfaces':'un--when'(case V0 of {'Idris.Prelude.IO.MkHasIO', E23, E24} -> (fun (V12, V13) -> case V12 of {'Idris.Prelude.Interfaces.MkMonad', E25, E26, E27} -> (fun (V14, V15, V16) -> V14 end(E25, E26, E27)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E23, E24)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end, V9, fun () -> case V0 of {'Idris.Prelude.IO.MkHasIO', E28, E29} -> (fun (V17, V18) -> case V17 of {'Idris.Prelude.Interfaces.MkMonad', E30, E31, E32} -> (fun (V19, V20, V21) -> case V19 of {'Idris.Prelude.Interfaces.MkApplicative', E33, E34, E35} -> (fun (V22, V23, V24) -> ((((V22('erased'))('erased'))(fun (V33) -> 0 end))(case V0 of {'Idris.Prelude.IO.MkHasIO', E36, E37} -> (fun (V25, V26) -> case V25 of {'Idris.Prelude.Interfaces.MkMonad', E38, E39, E40} -> (fun (V27, V28, V29) -> case V27 of {'Idris.Prelude.Interfaces.MkApplicative', E41, E42, E43} -> (fun (V30, V31, V32) -> ((V31('erased'))(('erlang':'apply'('os', 'putenv', [('unicode':'characters_to_list'(V1)) | [('unicode':'characters_to_list'(V2)) | []]])))) end(E41, E42, E43)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E38, E39, E40)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E36, E37)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end)) end(E33, E34, E35)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E30, E31, E32)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E28, E29)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end)), fun () -> case V0 of {'Idris.Prelude.IO.MkHasIO', E44, E45} -> (fun (V34, V35) -> case V34 of {'Idris.Prelude.Interfaces.MkMonad', E46, E47, E48} -> (fun (V36, V37, V38) -> case V36 of {'Idris.Prelude.Interfaces.MkApplicative', E49, E50, E51} -> (fun (V39, V40, V41) -> ((V40('erased'))(1)) end(E49, E50, E51)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E46, E47, E48)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E44, E45)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end)) end)) end(E2, E3, E4)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--halt'(V0, V1) -> case V0 of {'Idris.Prelude.IO.MkHasIO', E0, E1} -> (fun (V2, V3) -> case V2 of {'Idris.Prelude.Interfaces.MkMonad', E2, E3, E4} -> (fun (V4, V5, V6) -> ((((V5('erased'))('erased'))(case V0 of {'Idris.Prelude.IO.MkHasIO', E5, E6} -> (fun (V16, V17) -> case V16 of {'Idris.Prelude.Interfaces.MkMonad', E7, E8, E9} -> (fun (V18, V19, V20) -> case V18 of {'Idris.Prelude.Interfaces.MkApplicative', E10, E11, E12} -> (fun (V21, V22, V23) -> ((V22('erased'))(('erlang':'apply'('erlang', 'halt', [V1 | []])))) end(E10, E11, E12)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E7, E8, E9)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E5, E6)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end))(fun (V7) -> case V0 of {'Idris.Prelude.IO.MkHasIO', E13, E14} -> (fun (V8, V9) -> case V8 of {'Idris.Prelude.Interfaces.MkMonad', E15, E16, E17} -> (fun (V10, V11, V12) -> case V10 of {'Idris.Prelude.Interfaces.MkApplicative', E18, E19, E20} -> (fun (V13, V14, V15) -> ((V14('erased'))(V7)) end(E18, E19, E20)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E15, E16, E17)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E13, E14)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end)) end(E2, E3, E4)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--getEnvironment'(V0) -> case V0 of {'Idris.Prelude.IO.MkHasIO', E0, E1} -> (fun (V1, V2) -> case V1 of {'Idris.Prelude.Interfaces.MkMonad', E2, E3, E4} -> (fun (V3, V4, V5) -> ((((V4('erased'))('erased'))(case V0 of {'Idris.Prelude.IO.MkHasIO', E5, E6} -> (fun (V18, V19) -> case V18 of {'Idris.Prelude.Interfaces.MkMonad', E7, E8, E9} -> (fun (V20, V21, V22) -> case V20 of {'Idris.Prelude.Interfaces.MkApplicative', E10, E11, E12} -> (fun (V23, V24, V25) -> ((V24('erased'))(('erlang':'apply'('os', 'getenv', [])))) end(E10, E11, E12)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E7, E8, E9)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E5, E6)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end))(fun (V6) -> case V0 of {'Idris.Prelude.IO.MkHasIO', E13, E14} -> (fun (V7, V8) -> case V7 of {'Idris.Prelude.Interfaces.MkMonad', E15, E16, E17} -> (fun (V9, V10, V11) -> case V9 of {'Idris.Prelude.Interfaces.MkApplicative', E18, E19, E20} -> (fun (V12, V13, V14) -> ((V13('erased'))(('Idris.Idris2.Prelude.Types':'dn--un--map_Functor_List'(fun (V15) -> case V15 of E21 -> (fun (V16) -> ('nested--3565-1587--in--un--splitEq'(V0, V16)) end((fun (V17) -> ('unicode':'characters_to_binary'(V17)) end(E21)))); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end, V6)))) end(E18, E19, E20)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E15, E16, E17)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E13, E14)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end)) end(E2, E3, E4)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--getEnv'(V0, V1) -> case V0 of {'Idris.Prelude.IO.MkHasIO', E0, E1} -> (fun (V2, V3) -> case V2 of {'Idris.Prelude.Interfaces.MkMonad', E2, E3, E4} -> (fun (V4, V5, V6) -> ((((V5('erased'))('erased'))(case V0 of {'Idris.Prelude.IO.MkHasIO', E5, E6} -> (fun (V29, V30) -> case V29 of {'Idris.Prelude.Interfaces.MkMonad', E7, E8, E9} -> (fun (V31, V32, V33) -> case V31 of {'Idris.Prelude.Interfaces.MkApplicative', E10, E11, E12} -> (fun (V34, V35, V36) -> ((V35('erased'))(('erlang':'apply'('os', 'getenv', [('unicode':'characters_to_list'(V1)) | []])))) end(E10, E11, E12)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E7, E8, E9)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E5, E6)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end))(fun (V7) -> case ('Idris.Idris2.Erlang.Decode':'un--erlDecode'({'Idris.Erlang.Types.ETErlCharlist'}, fun (V8) -> ('Idris.Idris2.Erlang.Decode':'un--charlist'(V8)) end, V7)) of {'Idris.Prelude.Types.Right', E13} -> (fun (V9) -> case V9 of E14 -> (fun (V10) -> case V0 of {'Idris.Prelude.IO.MkHasIO', E15, E16} -> (fun (V11, V12) -> case V11 of {'Idris.Prelude.Interfaces.MkMonad', E17, E18, E19} -> (fun (V13, V14, V15) -> case V13 of {'Idris.Prelude.Interfaces.MkApplicative', E20, E21, E22} -> (fun (V16, V17, V18) -> ((V17('erased'))({'Idris.Prelude.Types.Just', V10})) end(E20, E21, E22)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E17, E18, E19)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E15, E16)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end((fun (V19) -> ('unicode':'characters_to_binary'(V19)) end(E14)))); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E13)); {'Idris.Prelude.Types.Left', E23} -> (fun (V20) -> case V0 of {'Idris.Prelude.IO.MkHasIO', E24, E25} -> (fun (V21, V22) -> case V21 of {'Idris.Prelude.Interfaces.MkMonad', E26, E27, E28} -> (fun (V23, V24, V25) -> case V23 of {'Idris.Prelude.Interfaces.MkApplicative', E29, E30, E31} -> (fun (V26, V27, V28) -> ((V27('erased'))({'Idris.Prelude.Types.Nothing'})) end(E29, E30, E31)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E26, E27, E28)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E24, E25)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E23)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end)) end(E2, E3, E4)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--getArgs'(V0) -> case V0 of {'Idris.Prelude.IO.MkHasIO', E0, E1} -> (fun (V1, V2) -> case V1 of {'Idris.Prelude.Interfaces.MkMonad', E2, E3, E4} -> (fun (V3, V4, V5) -> ((((V4('erased'))('erased'))(case V0 of {'Idris.Prelude.IO.MkHasIO', E5, E6} -> (fun (V18, V19) -> case V18 of {'Idris.Prelude.Interfaces.MkMonad', E7, E8, E9} -> (fun (V20, V21, V22) -> case V20 of {'Idris.Prelude.Interfaces.MkApplicative', E10, E11, E12} -> (fun (V23, V24, V25) -> ((V24('erased'))(('erlang':'apply'('init', 'get_plain_arguments', [])))) end(E10, E11, E12)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E7, E8, E9)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E5, E6)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end))(fun (V6) -> case V0 of {'Idris.Prelude.IO.MkHasIO', E13, E14} -> (fun (V7, V8) -> case V7 of {'Idris.Prelude.Interfaces.MkMonad', E15, E16, E17} -> (fun (V9, V10, V11) -> case V9 of {'Idris.Prelude.Interfaces.MkApplicative', E18, E19, E20} -> (fun (V12, V13, V14) -> ((V13('erased'))(('Idris.Idris2.Prelude.Types':'dn--un--map_Functor_List'(fun (V15) -> case V15 of E21 -> (fun (V16) -> V16 end((fun (V17) -> ('unicode':'characters_to_binary'(V17)) end(E21)))); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end, V6)))) end(E18, E19, E20)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E15, E16, E17)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E13, E14)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end)) end(E2, E3, E4)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--exitWith'(V0, V1) -> case V1 of {'Idris.Erlang.System.ExitSuccess'} -> (fun () -> ('un--halt'(V0, 0)) end()); {'Idris.Erlang.System.ExitFailure', E0, E1} -> (fun (V2, V3) -> ('un--halt'(V0, V2)) end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--exitSuccess'(V0) -> ('un--exitWith'(V0, {'Idris.Erlang.System.ExitSuccess'})).
'un--exitFailure'(V0) -> ('un--exitWith'(V0, {'Idris.Erlang.System.ExitFailure', 1, 0})).
