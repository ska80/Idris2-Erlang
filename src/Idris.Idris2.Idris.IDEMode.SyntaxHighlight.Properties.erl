-module('Idris.Idris2.Idris.IDEMode.SyntaxHighlight.Properties').
-compile('no_auto_import').
-compile('inline').
-compile({'inline_size',24}).
-export([
  'un--.format'/1,
  'un--.decor'/1,
  'un--format'/1,
  'un--decor'/1
]).
'un--.format'(V0) -> case V0 of {'Idris.Idris.IDEMode.SyntaxHighlight.MkProperties', E0, E1} -> (fun (V1, V2) -> V2 end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--.decor'(V0) -> case V0 of {'Idris.Idris.IDEMode.SyntaxHighlight.MkProperties', E0, E1} -> (fun (V1, V2) -> V1 end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--format'(V0) -> case V0 of {'Idris.Idris.IDEMode.SyntaxHighlight.MkProperties', E0, E1} -> (fun (V1, V2) -> V2 end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--decor'(V0) -> case V0 of {'Idris.Idris.IDEMode.SyntaxHighlight.MkProperties', E0, E1} -> (fun (V1, V2) -> V1 end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
