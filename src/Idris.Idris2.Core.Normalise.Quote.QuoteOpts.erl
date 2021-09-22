-module('Idris.Idris2.Core.Normalise.Quote.QuoteOpts').
-compile('no_auto_import').
-compile('inline').
-compile({'inline_size',24}).
-export([
  'un--.topLevel'/1,
  'un--.sizeLimit'/1,
  'un--.patterns'/1,
  'un--topLevel'/1,
  'un--sizeLimit'/1,
  'un--patterns'/1
]).
'un--.topLevel'(V0) -> case V0 of {'Idris.Core.Normalise.Quote.MkQuoteOpts', E0, E1, E2} -> (fun (V1, V2, V3) -> V1 end(E0, E1, E2)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--.sizeLimit'(V0) -> case V0 of {'Idris.Core.Normalise.Quote.MkQuoteOpts', E0, E1, E2} -> (fun (V1, V2, V3) -> V3 end(E0, E1, E2)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--.patterns'(V0) -> case V0 of {'Idris.Core.Normalise.Quote.MkQuoteOpts', E0, E1, E2} -> (fun (V1, V2, V3) -> V2 end(E0, E1, E2)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--topLevel'(V0) -> case V0 of {'Idris.Core.Normalise.Quote.MkQuoteOpts', E0, E1, E2} -> (fun (V1, V2, V3) -> V1 end(E0, E1, E2)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--sizeLimit'(V0) -> case V0 of {'Idris.Core.Normalise.Quote.MkQuoteOpts', E0, E1, E2} -> (fun (V1, V2, V3) -> V3 end(E0, E1, E2)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--patterns'(V0) -> case V0 of {'Idris.Core.Normalise.Quote.MkQuoteOpts', E0, E1, E2} -> (fun (V1, V2, V3) -> V2 end(E0, E1, E2)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
