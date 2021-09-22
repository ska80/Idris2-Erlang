-module('Idris.Idris2.Erlang.Types').
-compile('no_auto_import').
-compile('inline').
-compile({'inline_size',24}).
-export([
  'un--ErlMapEntryValueType'/1,
  'un--ErlAnyMap'/0,
  'un--.='/2
]).
'un--ErlMapEntryValueType'(V0) -> case V0 of {'Idris.Erlang.Types.MkMapEntry', E0, E1} -> (fun (V1, V2) -> V2 end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--ErlAnyMap'() -> {'Idris.Erlang.Types.ErlMapSubset', []}.
'un--.='(V0, V1) -> {'Idris.Erlang.Types.MkMapEntry', V0, V1}.
