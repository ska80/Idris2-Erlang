-module('Idris.Idris2.Core.TT.Bounds').
-compile('no_auto_import').
-compile('inline').
-compile({'inline_size',24}).
-export([
  'un--sizeOf'/1
]).
'un--sizeOf'(V0) -> case V0 of {'Idris.Core.TT.Bounds.None'} -> (fun () -> ('Idris.Idris2.Core.TT.SizeOf':'un--zero'()) end()); {'Idris.Core.TT.Bounds.Add', E0, E1, E2} -> (fun (V1, V2, V3) -> ('Idris.Idris2.Core.TT.SizeOf':'un--suc'(('un--sizeOf'(V3)))) end(E0, E1, E2)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
