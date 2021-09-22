-module('Idris.Idris2.Data.DPair.DPair').
-compile('no_auto_import').
-compile('inline').
-compile({'inline_size',24}).
-export([
  'case--==-678'/7,
  'dn--un--__Impl_Eq_((DPair $k) $v)'/2,
  'dn--un--==_Eq_((DPair $k) $v)'/4,
  'dn--un--/=_Eq_((DPair $k) $v)'/4,
  'un--uncurry'/2,
  'un--curry'/3,
  'un--bimap'/3
]).
'case--==-678'(V0, V1, V2, V3, V4, V5, V6) -> case V6 of {'Idris.Prelude.Types.Yes', E0} -> (fun (V7) -> case V7 of 0 -> case (V1(V2)) of {'Idris.Prelude.EqOrd.MkEq', E1, E2} -> (fun (V8, V9) -> ((V8(V3))(V5)) end(E1, E2)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end; _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E0)); {'Idris.Prelude.Types.No', E3} -> (fun (V10) -> 0 end(E3)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'dn--un--__Impl_Eq_((DPair $k) $v)'(V0, V1) -> {'Idris.Prelude.EqOrd.MkEq', fun (V2) -> fun (V3) -> ('dn--un--==_Eq_((DPair $k) $v)'(V0, fun (V4) -> (V1(V4)) end, V2, V3)) end end, fun (V5) -> fun (V6) -> ('dn--un--/=_Eq_((DPair $k) $v)'(V0, fun (V7) -> (V1(V7)) end, V5, V6)) end end}.
'dn--un--==_Eq_((DPair $k) $v)'(V0, V1, V2, V3) -> case V2 of {'Idris.Builtin.DPair.MkDPair', E0, E1} -> (fun (V4, V5) -> case V3 of {'Idris.Builtin.DPair.MkDPair', E2, E3} -> (fun (V6, V7) -> case ((V0(V4))(V6)) of {'Idris.Prelude.Types.Yes', E4} -> (fun (V8) -> case V8 of 0 -> case (V1(V4)) of {'Idris.Prelude.EqOrd.MkEq', E5, E6} -> (fun (V9, V10) -> ((V9(V5))(V7)) end(E5, E6)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end; _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E4)); {'Idris.Prelude.Types.No', E7} -> (fun (V11) -> 0 end(E7)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E2, E3)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'dn--un--/=_Eq_((DPair $k) $v)'(V0, V1, V2, V3) -> case ('dn--un--==_Eq_((DPair $k) $v)'(V0, fun (V4) -> (V1(V4)) end, V2, V3)) of 1 -> 0; 0 -> 1; _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--uncurry'(V0, V1) -> ((V0(case V1 of {'Idris.Builtin.DPair.MkDPair', E0, E1} -> (fun (V4, V5) -> V4 end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end))(case V1 of {'Idris.Builtin.DPair.MkDPair', E2, E3} -> (fun (V2, V3) -> V3 end(E2, E3)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end)).
'un--curry'(V0, V1, V2) -> (V0({'Idris.Builtin.DPair.MkDPair', V1, V2})).
'un--bimap'(V0, V1, V2) -> case V2 of {'Idris.Builtin.DPair.MkDPair', E0, E1} -> (fun (V3, V4) -> {'Idris.Builtin.DPair.MkDPair', (V0(V3)), ((V1('erased'))(V4))} end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
