-module('Idris.Idris2.Core.Context.Context.PMDefInfo').
-compile('no_auto_import').
-compile('inline').
-compile({'inline_size',24}).
-export([
  'un--.holeInfo'/1,
  'un--.externalDecl'/1,
  'un--.alwaysReduce'/1,
  'un--holeInfo'/1,
  'un--externalDecl'/1,
  'un--alwaysReduce'/1
]).
'un--.holeInfo'(V0) -> case V0 of {'Idris.Core.Context.Context.MkPMDefInfo', E0, E1, E2} -> (fun (V1, V2, V3) -> V1 end(E0, E1, E2)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--.externalDecl'(V0) -> case V0 of {'Idris.Core.Context.Context.MkPMDefInfo', E0, E1, E2} -> (fun (V1, V2, V3) -> V3 end(E0, E1, E2)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--.alwaysReduce'(V0) -> case V0 of {'Idris.Core.Context.Context.MkPMDefInfo', E0, E1, E2} -> (fun (V1, V2, V3) -> V2 end(E0, E1, E2)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--holeInfo'(V0) -> case V0 of {'Idris.Core.Context.Context.MkPMDefInfo', E0, E1, E2} -> (fun (V1, V2, V3) -> V1 end(E0, E1, E2)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--externalDecl'(V0) -> case V0 of {'Idris.Core.Context.Context.MkPMDefInfo', E0, E1, E2} -> (fun (V1, V2, V3) -> V3 end(E0, E1, E2)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--alwaysReduce'(V0) -> case V0 of {'Idris.Core.Context.Context.MkPMDefInfo', E0, E1, E2} -> (fun (V1, V2, V3) -> V2 end(E0, E1, E2)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
