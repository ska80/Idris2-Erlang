-module('Idris.Idris2.Idris.Parser.Let.LetBinder').
-compile('no_auto_import').
-compile('inline').
-compile({'inline_size',24}).
-export([
  'un--.letUsage'/1,
  'un--.letUnhappy'/1,
  'un--.letPattern'/1,
  'un--.letBoundType'/1,
  'un--.letBoundTerm'/1,
  'un--letUsage'/1,
  'un--letUnhappy'/1,
  'un--letPattern'/1,
  'un--letBoundType'/1,
  'un--letBoundTerm'/1
]).
'un--.letUsage'(V0) -> case V0 of {'Idris.Idris.Parser.Let.MkLetBinder', E0, E1, E2, E3, E4} -> (fun (V1, V2, V3, V4, V5) -> V1 end(E0, E1, E2, E3, E4)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--.letUnhappy'(V0) -> case V0 of {'Idris.Idris.Parser.Let.MkLetBinder', E0, E1, E2, E3, E4} -> (fun (V1, V2, V3, V4, V5) -> V5 end(E0, E1, E2, E3, E4)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--.letPattern'(V0) -> case V0 of {'Idris.Idris.Parser.Let.MkLetBinder', E0, E1, E2, E3, E4} -> (fun (V1, V2, V3, V4, V5) -> V2 end(E0, E1, E2, E3, E4)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--.letBoundType'(V0) -> case V0 of {'Idris.Idris.Parser.Let.MkLetBinder', E0, E1, E2, E3, E4} -> (fun (V1, V2, V3, V4, V5) -> V3 end(E0, E1, E2, E3, E4)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--.letBoundTerm'(V0) -> case V0 of {'Idris.Idris.Parser.Let.MkLetBinder', E0, E1, E2, E3, E4} -> (fun (V1, V2, V3, V4, V5) -> V4 end(E0, E1, E2, E3, E4)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--letUsage'(V0) -> case V0 of {'Idris.Idris.Parser.Let.MkLetBinder', E0, E1, E2, E3, E4} -> (fun (V1, V2, V3, V4, V5) -> V1 end(E0, E1, E2, E3, E4)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--letUnhappy'(V0) -> case V0 of {'Idris.Idris.Parser.Let.MkLetBinder', E0, E1, E2, E3, E4} -> (fun (V1, V2, V3, V4, V5) -> V5 end(E0, E1, E2, E3, E4)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--letPattern'(V0) -> case V0 of {'Idris.Idris.Parser.Let.MkLetBinder', E0, E1, E2, E3, E4} -> (fun (V1, V2, V3, V4, V5) -> V2 end(E0, E1, E2, E3, E4)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--letBoundType'(V0) -> case V0 of {'Idris.Idris.Parser.Let.MkLetBinder', E0, E1, E2, E3, E4} -> (fun (V1, V2, V3, V4, V5) -> V3 end(E0, E1, E2, E3, E4)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--letBoundTerm'(V0) -> case V0 of {'Idris.Idris.Parser.Let.MkLetBinder', E0, E1, E2, E3, E4} -> (fun (V1, V2, V3, V4, V5) -> V4 end(E0, E1, E2, E3, E4)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
