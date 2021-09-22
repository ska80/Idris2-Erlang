-module('Idris.Idris2.Prelude.Types.List').
-compile('no_auto_import').
-compile('inline').
-compile({'inline_size',24}).
-export([
  'un--tailRecAppend'/2,
  'un--reverseOnto'/2,
  'un--reverse'/1,
  'un--length'/1,
  'un--++'/2
]).
'un--tailRecAppend'(V0, V1) -> ('un--reverseOnto'(V1, ('un--reverse'(V0)))).
'un--reverseOnto'(V0, V1) -> case V1 of [] -> V0; [E0 | E1] -> (fun (V2, V3) -> ('un--reverseOnto'([V2 | V0], V3)) end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--reverse'(V0) -> ('un--reverseOnto'([], V0)).
'un--length'(V0) -> case V0 of [] -> 0; [E0 | E1] -> (fun (V1, V2) -> (1 + ('un--length'(V2))) end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--++'(V0, V1) -> case V0 of [] -> V1; [E0 | E1] -> (fun (V2, V3) -> [V2 | ('un--++'(V3, V1))] end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
