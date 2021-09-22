-module('Idris.Idris2.Core.Options.PrimNames').
-compile('no_auto_import').
-compile('inline').
-compile({'inline_size',24}).
-export([
  'un--.fromStringName'/1,
  'un--.fromIntegerName'/1,
  'un--.fromDoubleName'/1,
  'un--.fromCharName'/1,
  'un--fromStringName'/1,
  'un--fromIntegerName'/1,
  'un--fromDoubleName'/1,
  'un--fromCharName'/1
]).
'un--.fromStringName'(V0) -> case V0 of {'Idris.Core.Options.MkPrimNs', E0, E1, E2, E3} -> (fun (V1, V2, V3, V4) -> V2 end(E0, E1, E2, E3)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--.fromIntegerName'(V0) -> case V0 of {'Idris.Core.Options.MkPrimNs', E0, E1, E2, E3} -> (fun (V1, V2, V3, V4) -> V1 end(E0, E1, E2, E3)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--.fromDoubleName'(V0) -> case V0 of {'Idris.Core.Options.MkPrimNs', E0, E1, E2, E3} -> (fun (V1, V2, V3, V4) -> V4 end(E0, E1, E2, E3)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--.fromCharName'(V0) -> case V0 of {'Idris.Core.Options.MkPrimNs', E0, E1, E2, E3} -> (fun (V1, V2, V3, V4) -> V3 end(E0, E1, E2, E3)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--fromStringName'(V0) -> case V0 of {'Idris.Core.Options.MkPrimNs', E0, E1, E2, E3} -> (fun (V1, V2, V3, V4) -> V2 end(E0, E1, E2, E3)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--fromIntegerName'(V0) -> case V0 of {'Idris.Core.Options.MkPrimNs', E0, E1, E2, E3} -> (fun (V1, V2, V3, V4) -> V1 end(E0, E1, E2, E3)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--fromDoubleName'(V0) -> case V0 of {'Idris.Core.Options.MkPrimNs', E0, E1, E2, E3} -> (fun (V1, V2, V3, V4) -> V4 end(E0, E1, E2, E3)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--fromCharName'(V0) -> case V0 of {'Idris.Core.Options.MkPrimNs', E0, E1, E2, E3} -> (fun (V1, V2, V3, V4) -> V3 end(E0, E1, E2, E3)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
