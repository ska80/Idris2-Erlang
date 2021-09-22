-module('Idris.Idris2.Idris.Env.EnvDesc').
-compile('no_auto_import').
-compile('inline').
-compile({'inline_size',24}).
-export([
  'un--.name'/1,
  'un--.help'/1,
  'un--name'/1,
  'un--help'/1
]).
'un--.name'(V0) -> case V0 of {'Idris.Idris.Env.MkEnvDesc', E0, E1} -> (fun (V1, V2) -> V1 end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--.help'(V0) -> case V0 of {'Idris.Idris.Env.MkEnvDesc', E0, E1} -> (fun (V1, V2) -> V2 end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--name'(V0) -> case V0 of {'Idris.Idris.Env.MkEnvDesc', E0, E1} -> (fun (V1, V2) -> V1 end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--help'(V0) -> case V0 of {'Idris.Idris.Env.MkEnvDesc', E0, E1} -> (fun (V1, V2) -> V2 end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
