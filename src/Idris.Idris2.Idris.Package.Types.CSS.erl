-module('Idris.Idris2.Idris.Package.Types.CSS').
-compile('no_auto_import').
-compile('inline').
-compile({'inline_size',24}).
-export([
  'un--.stylename'/1,
  'un--.filename'/1,
  'un--stylename'/1,
  'un--filename'/1
]).
'un--.stylename'(V0) -> case V0 of {'Idris.Idris.Package.Types.MkCSS', E0, E1} -> (fun (V1, V2) -> V1 end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--.filename'(V0) -> case V0 of {'Idris.Idris.Package.Types.MkCSS', E0, E1} -> (fun (V1, V2) -> V2 end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--stylename'(V0) -> case V0 of {'Idris.Idris.Package.Types.MkCSS', E0, E1} -> (fun (V1, V2) -> V1 end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--filename'(V0) -> case V0 of {'Idris.Idris.Package.Types.MkCSS', E0, E1} -> (fun (V1, V2) -> V2 end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
