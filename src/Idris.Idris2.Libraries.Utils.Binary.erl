-module('Idris.Idris2.Libraries.Utils.Binary').
-compile('no_auto_import').
-compile('inline').
-compile({'inline_size',24}).
-export([
  'un--writeToFile'/2,
  'un--toRead'/1,
  'un--readFromFile'/2,
  'un--nonEmptyRev'/1,
  'un--newBinary'/2,
  'un--incLoc'/2,
  'un--fromBuffer'/2,
  'un--dumpBin'/2,
  'un--blockSize'/0,
  'un--avail'/1,
  'un--appended'/2
]).
'un--writeToFile'(V0, V1) -> ('Idris.Idris2.Erlang.Data.Buffer':'un--writeBufferToFile'({'Idris.Prelude.IO.MkHasIO', {'Idris.Prelude.Interfaces.MkMonad', {'Idris.Prelude.Interfaces.MkApplicative', fun (V2) -> fun (V3) -> fun (V4) -> fun (V5) -> fun (V6) -> ('Idris.Idris2.Prelude.IO':'dn--un--map_Functor_IO'(V4, V5, V6)) end end end end end, fun (V7) -> fun (V8) -> fun (V9) -> V8 end end end, fun (V10) -> fun (V11) -> fun (V12) -> fun (V13) -> fun (V14) -> begin (V15 = (V12(V14))), begin (V16 = (V13(V14))), (V15(V16)) end end end end end end end}, fun (V17) -> fun (V18) -> fun (V19) -> fun (V20) -> fun (V21) -> begin (V22 = (V19(V21))), ((V20(V22))(V21)) end end end end end end, fun (V23) -> fun (V24) -> fun (V25) -> begin (V26 = (V24(V25))), (V26(V25)) end end end end}, fun (V27) -> fun (V28) -> V28 end end}, V0, case V1 of {'Idris.Libraries.Utils.Binary.MkBin', E0, E1, E2, E3} -> (fun (V29, V30, V31, V32) -> V29 end(E0, E1, E2, E3)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end, case V1 of {'Idris.Libraries.Utils.Binary.MkBin', E4, E5, E6, E7} -> (fun (V33, V34, V35, V36) -> V36 end(E4, E5, E6, E7)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end)).
'un--toRead'(V0) -> ((case V0 of {'Idris.Libraries.Utils.Binary.MkBin', E0, E1, E2, E3} -> (fun (V1, V2, V3, V4) -> V4 end(E0, E1, E2, E3)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end - case V0 of {'Idris.Libraries.Utils.Binary.MkBin', E4, E5, E6, E7} -> (fun (V5, V6, V7, V8) -> V6 end(E4, E5, E6, E7)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end) rem 9223372036854775808).
'un--readFromFile'(V0, V1) -> begin (V29 = (('Idris.Idris2.Erlang.Data.Buffer':'un--createBufferFromFile'({'Idris.Prelude.IO.MkHasIO', {'Idris.Prelude.Interfaces.MkMonad', {'Idris.Prelude.Interfaces.MkApplicative', fun (V2) -> fun (V3) -> fun (V4) -> fun (V5) -> fun (V6) -> ('Idris.Idris2.Prelude.IO':'dn--un--map_Functor_IO'(V4, V5, V6)) end end end end end, fun (V7) -> fun (V8) -> fun (V9) -> V8 end end end, fun (V10) -> fun (V11) -> fun (V12) -> fun (V13) -> fun (V14) -> begin (V15 = (V12(V14))), begin (V16 = (V13(V14))), (V15(V16)) end end end end end end end}, fun (V17) -> fun (V18) -> fun (V19) -> fun (V20) -> fun (V21) -> begin (V22 = (V19(V21))), ((V20(V22))(V21)) end end end end end end, fun (V23) -> fun (V24) -> fun (V25) -> begin (V26 = (V24(V25))), (V26(V25)) end end end end}, fun (V27) -> fun (V28) -> V28 end end}, V0))(V1))), case V29 of {'Idris.Prelude.Types.Right', E0} -> (fun (V30) -> begin (V58 = (('Idris.Idris2.Erlang.Data.Buffer':'un--rawSize'({'Idris.Prelude.IO.MkHasIO', {'Idris.Prelude.Interfaces.MkMonad', {'Idris.Prelude.Interfaces.MkApplicative', fun (V31) -> fun (V32) -> fun (V33) -> fun (V34) -> fun (V35) -> ('Idris.Idris2.Prelude.IO':'dn--un--map_Functor_IO'(V33, V34, V35)) end end end end end, fun (V36) -> fun (V37) -> fun (V38) -> V37 end end end, fun (V39) -> fun (V40) -> fun (V41) -> fun (V42) -> fun (V43) -> begin (V44 = (V41(V43))), begin (V45 = (V42(V43))), (V44(V45)) end end end end end end end}, fun (V46) -> fun (V47) -> fun (V48) -> fun (V49) -> fun (V50) -> begin (V51 = (V48(V50))), ((V49(V51))(V50)) end end end end end end, fun (V52) -> fun (V53) -> fun (V54) -> begin (V55 = (V53(V54))), (V55(V54)) end end end end}, fun (V56) -> fun (V57) -> V57 end end}, V30))(V1))), {'Idris.Prelude.Types.Right', {'Idris.Libraries.Utils.Binary.MkBin', V30, 0, V58, V58}} end end(E0)); {'Idris.Prelude.Types.Left', E1} -> (fun (V59) -> {'Idris.Prelude.Types.Left', V59} end(E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end.
'un--nonEmptyRev'(V0) -> case V0 of [] -> 0; [E0 | E1] -> (fun (V1, V2) -> 0 end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--newBinary'(V0, V1) -> {'Idris.Libraries.Utils.Binary.MkBin', V0, 0, V1, 0}.
'un--incLoc'(V0, V1) -> case V1 of {'Idris.Libraries.Utils.Binary.MkBin', E0, E1, E2, E3} -> (fun (V2, V3, V4, V5) -> {'Idris.Libraries.Utils.Binary.MkBin', V2, ((V3 + V0) rem 9223372036854775808), V4, V5} end(E0, E1, E2, E3)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--fromBuffer'(V0, V1) -> begin (V29 = (('Idris.Idris2.Erlang.Data.Buffer':'un--rawSize'({'Idris.Prelude.IO.MkHasIO', {'Idris.Prelude.Interfaces.MkMonad', {'Idris.Prelude.Interfaces.MkApplicative', fun (V2) -> fun (V3) -> fun (V4) -> fun (V5) -> fun (V6) -> ('Idris.Idris2.Prelude.IO':'dn--un--map_Functor_IO'(V4, V5, V6)) end end end end end, fun (V7) -> fun (V8) -> fun (V9) -> V8 end end end, fun (V10) -> fun (V11) -> fun (V12) -> fun (V13) -> fun (V14) -> begin (V15 = (V12(V14))), begin (V16 = (V13(V14))), (V15(V16)) end end end end end end end}, fun (V17) -> fun (V18) -> fun (V19) -> fun (V20) -> fun (V21) -> begin (V22 = (V19(V21))), ((V20(V22))(V21)) end end end end end end, fun (V23) -> fun (V24) -> fun (V25) -> begin (V26 = (V24(V25))), (V26(V25)) end end end end}, fun (V27) -> fun (V28) -> V28 end end}, V0))(V1))), {'Idris.Libraries.Utils.Binary.MkBin', V0, 0, V29, V29} end.
'un--dumpBin'(V0, V1) -> begin (V33 = (('Idris.Idris2.Erlang.Data.Buffer':'un--bufferData'({'Idris.Prelude.IO.MkHasIO', {'Idris.Prelude.Interfaces.MkMonad', {'Idris.Prelude.Interfaces.MkApplicative', fun (V2) -> fun (V3) -> fun (V4) -> fun (V5) -> fun (V6) -> ('Idris.Idris2.Prelude.IO':'dn--un--map_Functor_IO'(V4, V5, V6)) end end end end end, fun (V7) -> fun (V8) -> fun (V9) -> V8 end end end, fun (V10) -> fun (V11) -> fun (V12) -> fun (V13) -> fun (V14) -> begin (V15 = (V12(V14))), begin (V16 = (V13(V14))), (V15(V16)) end end end end end end end}, fun (V17) -> fun (V18) -> fun (V19) -> fun (V20) -> fun (V21) -> begin (V22 = (V19(V21))), ((V20(V22))(V21)) end end end end end end, fun (V23) -> fun (V24) -> fun (V25) -> begin (V26 = (V24(V25))), (V26(V25)) end end end end}, fun (V27) -> fun (V28) -> V28 end end}, case V0 of {'Idris.Libraries.Utils.Binary.MkBin', E0, E1, E2, E3} -> (fun (V29, V30, V31, V32) -> V29 end(E0, E1, E2, E3)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end))(V1))), (('Idris.Idris2.Prelude.IO':'un--printLn'({'Idris.Builtin.MkPair', {'Idris.Prelude.IO.MkHasIO', {'Idris.Prelude.Interfaces.MkMonad', {'Idris.Prelude.Interfaces.MkApplicative', fun (V34) -> fun (V35) -> fun (V36) -> fun (V37) -> fun (V38) -> ('Idris.Idris2.Prelude.IO':'dn--un--map_Functor_IO'(V36, V37, V38)) end end end end end, fun (V39) -> fun (V40) -> fun (V41) -> V40 end end end, fun (V42) -> fun (V43) -> fun (V44) -> fun (V45) -> fun (V46) -> begin (V47 = (V44(V46))), begin (V48 = (V45(V46))), (V47(V48)) end end end end end end end}, fun (V49) -> fun (V50) -> fun (V51) -> fun (V52) -> fun (V53) -> begin (V54 = (V51(V53))), ((V52(V54))(V53)) end end end end end end, fun (V55) -> fun (V56) -> fun (V57) -> begin (V58 = (V56(V57))), (V58(V57)) end end end end}, fun (V59) -> fun (V60) -> V60 end end}, {'Idris.Prelude.Show.MkShow', fun (V61) -> ('Idris.Idris2.Prelude.Show':'dn--un--show_Show_(List $a)'({'Idris.Prelude.Show.MkShow', fun (V62) -> ('Idris.Idris2.Prelude.Show':'dn--un--show_Show_Int'(V62)) end, fun (V63) -> fun (V64) -> ('Idris.Idris2.Prelude.Show':'dn--un--showPrec_Show_Int'(V63, V64)) end end}, V61)) end, fun (V65) -> fun (V66) -> ('Idris.Idris2.Prelude.Show':'dn--un--showPrec_Show_(List $a)'({'Idris.Prelude.Show.MkShow', fun (V67) -> ('Idris.Idris2.Prelude.Show':'dn--un--show_Show_Int'(V67)) end, fun (V68) -> fun (V69) -> ('Idris.Idris2.Prelude.Show':'dn--un--showPrec_Show_Int'(V68, V69)) end end}, V65, V66)) end end}}, V33))(V1)) end.
'un--blockSize'() -> 655360.
'un--avail'(V0) -> ((((case V0 of {'Idris.Libraries.Utils.Binary.MkBin', E0, E1, E2, E3} -> (fun (V1, V2, V3, V4) -> V3 end(E0, E1, E2, E3)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end - case V0 of {'Idris.Libraries.Utils.Binary.MkBin', E4, E5, E6, E7} -> (fun (V5, V6, V7, V8) -> V6 end(E4, E5, E6, E7)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end) rem 9223372036854775808) - 1) rem 9223372036854775808).
'un--appended'(V0, V1) -> case V1 of {'Idris.Libraries.Utils.Binary.MkBin', E0, E1, E2, E3} -> (fun (V2, V3, V4, V5) -> {'Idris.Libraries.Utils.Binary.MkBin', V2, ((V3 + V0) rem 9223372036854775808), V4, ((V5 + V0) rem 9223372036854775808)} end(E0, E1, E2, E3)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
