-module('Idris.Idris2.Libraries.Text.Parser').
-compile('no_auto_import').
-compile('inline').
-compile({'inline_size',24}).
-export([
  'un--when'/2,
  'un--unless'/2,
  'un--someTill'/3,
  'un--some'/1,
  'un--sepEndBy1'/3,
  'un--sepEndBy'/3,
  'un--sepBy1'/3,
  'un--sepBy'/3,
  'un--optional'/2,
  'un--option'/3,
  'un--match'/2,
  'un--manyTill'/3,
  'un--many'/1,
  'un--location'/0,
  'un--endLocation'/0,
  'un--endBy1'/3,
  'un--endBy'/3,
  'un--count1'/2,
  'un--count'/2,
  'un--column'/0,
  'un--choose'/4,
  'un--choiceMap'/4,
  'un--choice'/3,
  'un--between'/4,
  'un--afterSome'/3,
  'un--afterMany'/3
]).
'un--when'(V0, V1) -> case V0 of 1 -> (V1()); 0 -> {'Idris.Libraries.Text.Parser.Core.Empty', 0}; _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--unless'(V0, V1) -> ('un--when'(case V0 of 1 -> 0; 0 -> 1; _ -> ('erlang':'throw'("Error: Unreachable branch")) end, V1)).
'un--someTill'(V0, V1, V2) -> {'Idris.Libraries.Text.Parser.Core.SeqEat', case V0 of 1 -> 1; 0 -> 0; _ -> ('erlang':'throw'("Error: Unreachable branch")) end, V2, fun () -> fun (V3) -> {'Idris.Libraries.Text.Parser.Core.SeqEmpty', V0, 0, ('un--manyTill'(V0, V1, V2)), fun (V4) -> {'Idris.Libraries.Text.Parser.Core.Empty', {'Idris.Data.List1.:::', V3, V4}} end} end end}.
'un--some'(V0) -> {'Idris.Libraries.Text.Parser.Core.SeqEat', 0, V0, fun () -> fun (V1) -> {'Idris.Libraries.Text.Parser.Core.SeqEmpty', 0, 0, ('un--many'(V0)), fun (V2) -> {'Idris.Libraries.Text.Parser.Core.Empty', {'Idris.Data.List1.:::', V1, V2}} end} end end}.
'un--sepEndBy1'(V0, V1, V2) -> {'Idris.Libraries.Text.Parser.Core.SeqEmpty', V0, 0, ('Idris.Idris2.Libraries.Text.Parser.Core':'dn--un--map_Functor_(((Grammar $state) $tok) $c)'(V0, fun (V3) -> fun (V4) -> V3 end end, ('un--sepBy1'(V0, V1, V2)))), fun (V5) -> ('Idris.Idris2.Libraries.Text.Parser.Core':'dn--un--map_Functor_(((Grammar $state) $tok) $c)'(0, V5, ('un--optional'(1, V1)))) end}.
'un--sepEndBy'(V0, V1, V2) -> ('un--option'(V0, [], ('Idris.Idris2.Prelude.Interfaces':'un--<$>'(fun (V3) -> fun (V4) -> fun (V5) -> fun (V6) -> ('Idris.Idris2.Libraries.Text.Parser.Core':'dn--un--map_Functor_(((Grammar $state) $tok) $c)'(V0, V5, V6)) end end end end, fun (V7) -> ('Idris.Idris2.Data.List1':'un--forget'(V7)) end, ('un--sepEndBy1'(V0, V1, V2)))))).
'un--sepBy1'(V0, V1, V2) -> {'Idris.Libraries.Text.Parser.Core.SeqEmpty', V0, 0, {'Idris.Libraries.Text.Parser.Core.SeqEmpty', 0, V0, {'Idris.Libraries.Text.Parser.Core.Empty', fun (V3) -> fun (V4) -> {'Idris.Data.List1.:::', V3, V4} end end}, fun (V5) -> ('Idris.Idris2.Libraries.Text.Parser.Core':'dn--un--map_Functor_(((Grammar $state) $tok) $c)'(V0, V5, V2)) end}, fun (V6) -> ('Idris.Idris2.Libraries.Text.Parser.Core':'dn--un--map_Functor_(((Grammar $state) $tok) $c)'(0, V6, ('un--many'({'Idris.Libraries.Text.Parser.Core.SeqEmpty', 1, V0, ('Idris.Idris2.Libraries.Text.Parser.Core':'dn--un--map_Functor_(((Grammar $state) $tok) $c)'(1, fun (V7) -> fun (V8) -> V8 end end, V1)), fun (V9) -> ('Idris.Idris2.Libraries.Text.Parser.Core':'dn--un--map_Functor_(((Grammar $state) $tok) $c)'(V0, V9, V2)) end})))) end}.
'un--sepBy'(V0, V1, V2) -> ('un--option'(V0, [], ('Idris.Idris2.Prelude.Interfaces':'un--<$>'(fun (V3) -> fun (V4) -> fun (V5) -> fun (V6) -> ('Idris.Idris2.Libraries.Text.Parser.Core':'dn--un--map_Functor_(((Grammar $state) $tok) $c)'(V0, V5, V6)) end end end end, fun (V7) -> ('Idris.Idris2.Data.List1':'un--forget'(V7)) end, ('un--sepBy1'(V0, V1, V2)))))).
'un--optional'(V0, V1) -> ('un--option'(V0, {'Idris.Prelude.Types.Nothing'}, ('Idris.Idris2.Libraries.Text.Parser.Core':'dn--un--map_Functor_(((Grammar $state) $tok) $c)'(V0, fun (V2) -> {'Idris.Prelude.Types.Just', V2} end, V1)))).
'un--option'(V0, V1, V2) -> case V0 of 0 -> {'Idris.Libraries.Text.Parser.Core.Alt', 0, 0, V2, fun () -> {'Idris.Libraries.Text.Parser.Core.Empty', V1} end}; 1 -> {'Idris.Libraries.Text.Parser.Core.Alt', 1, 0, V2, fun () -> {'Idris.Libraries.Text.Parser.Core.Empty', V1} end}; _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--match'(V0, V1) -> {'Idris.Libraries.Text.Parser.Core.Terminal', <<"Unrecognised input"/utf8>>, fun (V2) -> case case ('Idris.Idris2.Builtin':'un--fst'(V0)) of {'Idris.Prelude.EqOrd.MkEq', E4, E5} -> (fun (V3, V4) -> ((V3(case V2 of {'Idris.Libraries.Text.Token.Tok', E6, E7} -> (fun (V5, V6) -> V5 end(E6, E7)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end))(V1)) end(E4, E5)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end of 1 -> {'Idris.Prelude.Types.Just', case ('Idris.Idris2.Builtin':'un--snd'(V0)) of {'Idris.Libraries.Text.Token.dn--un--__mkTokenKind', E0, E1} -> (fun (V7, V8) -> ((V8(V1))(case V2 of {'Idris.Libraries.Text.Token.Tok', E2, E3} -> (fun (V9, V10) -> V10 end(E2, E3)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end)) end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end}; 0 -> {'Idris.Prelude.Types.Nothing'}; _ -> ('erlang':'throw'("Error: Unreachable branch")) end end}.
'un--manyTill'(V0, V1, V2) -> {'Idris.Libraries.Text.Parser.Core.Alt', V0, 1, ('Idris.Idris2.Libraries.Text.Parser.Core':'dn--un--map_Functor_(((Grammar $state) $tok) $c)'(V0, fun (V3) -> [] end, V1)), fun () -> ('Idris.Idris2.Prelude.Interfaces':'un--<$>'(fun (V4) -> fun (V5) -> fun (V6) -> fun (V7) -> ('Idris.Idris2.Libraries.Text.Parser.Core':'dn--un--map_Functor_(((Grammar $state) $tok) $c)'(1, V6, V7)) end end end end, fun (V8) -> ('Idris.Idris2.Data.List1':'un--forget'(V8)) end, ('un--someTill'(V0, V1, V2)))) end}.
'un--many'(V0) -> ('un--option'(1, [], ('Idris.Idris2.Prelude.Interfaces':'un--<$>'(fun (V1) -> fun (V2) -> fun (V3) -> fun (V4) -> ('Idris.Idris2.Libraries.Text.Parser.Core':'dn--un--map_Functor_(((Grammar $state) $tok) $c)'(1, V3, V4)) end end end end, fun (V5) -> ('Idris.Idris2.Data.List1':'un--forget'(V5)) end, ('un--some'(V0)))))).
'un--location'() -> ('Idris.Idris2.Prelude.Interfaces':'un--<$>'(fun (V0) -> fun (V1) -> fun (V2) -> fun (V3) -> ('Idris.Idris2.Libraries.Text.Parser.Core':'dn--un--map_Functor_(((Grammar $state) $tok) $c)'(0, V2, V3)) end end end end, fun (V4) -> ('Idris.Idris2.Libraries.Text.Bounded':'un--startBounds'(V4)) end, {'Idris.Libraries.Text.Parser.Core.Position'})).
'un--endLocation'() -> ('Idris.Idris2.Prelude.Interfaces':'un--<$>'(fun (V0) -> fun (V1) -> fun (V2) -> fun (V3) -> ('Idris.Idris2.Libraries.Text.Parser.Core':'dn--un--map_Functor_(((Grammar $state) $tok) $c)'(0, V2, V3)) end end end end, fun (V4) -> ('Idris.Idris2.Libraries.Text.Bounded':'un--endBounds'(V4)) end, {'Idris.Libraries.Text.Parser.Core.Position'})).
'un--endBy1'(V0, V1, V2) -> ('un--some'({'Idris.Libraries.Text.Parser.Core.SeqEmpty', V0, 1, ('Idris.Idris2.Libraries.Text.Parser.Core':'dn--un--map_Functor_(((Grammar $state) $tok) $c)'(V0, fun (V3) -> fun (V4) -> V3 end end, V2)), fun (V5) -> ('Idris.Idris2.Libraries.Text.Parser.Core':'dn--un--map_Functor_(((Grammar $state) $tok) $c)'(1, V5, V1)) end})).
'un--endBy'(V0, V1, V2) -> ('un--option'(1, [], ('Idris.Idris2.Prelude.Interfaces':'un--<$>'(fun (V3) -> fun (V4) -> fun (V5) -> fun (V6) -> ('Idris.Idris2.Libraries.Text.Parser.Core':'dn--un--map_Functor_(((Grammar $state) $tok) $c)'(1, V5, V6)) end end end end, fun (V7) -> ('Idris.Idris2.Data.List1':'un--forget'(V7)) end, ('un--endBy1'(V0, V1, V2)))))).
'un--count1'(V0, V1) -> {'Idris.Libraries.Text.Parser.Core.SeqEat', case ('Idris.Idris2.Data.Nat':'un--isSucc'(case V0 of {'Idris.Libraries.Text.Quantity.Qty', E0, E1} -> (fun (V2, V3) -> V2 end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end)) of 1 -> 1; 0 -> 0; _ -> ('erlang':'throw'("Error: Unreachable branch")) end, V1, fun () -> fun (V4) -> {'Idris.Libraries.Text.Parser.Core.SeqEmpty', ('Idris.Idris2.Data.Nat':'un--isSucc'(case V0 of {'Idris.Libraries.Text.Quantity.Qty', E2, E3} -> (fun (V5, V6) -> V5 end(E2, E3)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end)), 0, ('un--count'(V0, V1)), fun (V7) -> {'Idris.Libraries.Text.Parser.Core.Empty', [V4 | V7]} end} end end}.
'un--count'(V0, V1) -> case V0 of {'Idris.Libraries.Text.Quantity.Qty', E0, E1} -> (fun (V2, V3) -> case V2 of 0 -> case V3 of {'Idris.Prelude.Types.Nothing'} -> (fun () -> ('un--many'(V1)) end()); {'Idris.Prelude.Types.Just', E3} -> (fun (V4) -> case V4 of 0 -> {'Idris.Libraries.Text.Parser.Core.Empty', []}; _ -> begin (V5 = (V4 - 1)), ('un--option'(1, [], ('un--count1'(('Idris.Idris2.Libraries.Text.Quantity':'un--atMost'(V5)), V1)))) end end end(E3)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end; _ -> begin (V6 = (V2 - 1)), case V3 of {'Idris.Prelude.Types.Nothing'} -> (fun () -> ('un--count1'(('Idris.Idris2.Libraries.Text.Quantity':'un--atLeast'(V6)), V1)) end()); {'Idris.Prelude.Types.Just', E2} -> (fun (V7) -> case V7 of 0 -> {'Idris.Libraries.Text.Parser.Core.Fail', {'Idris.Prelude.Types.Nothing'}, 0, <<"Quantity out of order"/utf8>>}; _ -> begin (V8 = (V7 - 1)), ('un--count1'(('Idris.Idris2.Libraries.Text.Quantity':'un--between'((1 + V6), V8)), V1)) end end end(E2)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--column'() -> ('Idris.Idris2.Prelude.Interfaces':'un--<$>'(fun (V0) -> fun (V1) -> fun (V2) -> fun (V3) -> ('Idris.Idris2.Libraries.Text.Parser.Core':'dn--un--map_Functor_(((Grammar $state) $tok) $c)'(0, V2, V3)) end end end end, fun (V4) -> ('Idris.Idris2.Builtin':'un--snd'(V4)) end, ('un--location'()))).
'un--choose'(V0, V1, V2, V3) -> {'Idris.Libraries.Text.Parser.Core.Alt', V0, V1, ('Idris.Idris2.Libraries.Text.Parser.Core':'dn--un--map_Functor_(((Grammar $state) $tok) $c)'(V0, fun (V4) -> {'Idris.Prelude.Types.Left', V4} end, V2)), fun () -> ('Idris.Idris2.Libraries.Text.Parser.Core':'dn--un--map_Functor_(((Grammar $state) $tok) $c)'(V1, fun (V5) -> {'Idris.Prelude.Types.Right', V5} end, V3)) end}.
'un--choiceMap'(V0, V1, V2, V3) -> case V2 of {'Idris.Prelude.Interfaces.MkFoldable', E0, E1, E2, E3, E4, E5} -> (fun (V4, V5, V6, V7, V8, V9) -> (((((V4('erased'))('erased'))(fun (V10) -> fun (V11) -> {'Idris.Libraries.Text.Parser.Core.Alt', V0, V0, (V1(V10)), fun () -> V11 end} end end))({'Idris.Libraries.Text.Parser.Core.Fail', {'Idris.Prelude.Types.Nothing'}, 0, <<"No more options"/utf8>>}))(V3)) end(E0, E1, E2, E3, E4, E5)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--choice'(V0, V1, V2) -> ('un--choiceMap'(V1, fun (V3) -> V3 end, V0, V2)).
'un--between'(V0, V1, V2, V3) -> {'Idris.Libraries.Text.Parser.Core.SeqEmpty', 1, 1, ('Idris.Idris2.Libraries.Text.Parser.Core':'dn--un--map_Functor_(((Grammar $state) $tok) $c)'(1, fun (V4) -> fun (V5) -> V4 end end, {'Idris.Libraries.Text.Parser.Core.SeqEmpty', 1, V0, ('Idris.Idris2.Libraries.Text.Parser.Core':'dn--un--map_Functor_(((Grammar $state) $tok) $c)'(1, fun (V6) -> fun (V7) -> V7 end end, V1)), fun (V8) -> ('Idris.Idris2.Libraries.Text.Parser.Core':'dn--un--map_Functor_(((Grammar $state) $tok) $c)'(V0, V8, V3)) end})), fun (V9) -> ('Idris.Idris2.Libraries.Text.Parser.Core':'dn--un--map_Functor_(((Grammar $state) $tok) $c)'(1, V9, V2)) end}.
'un--afterSome'(V0, V1, V2) -> {'Idris.Libraries.Text.Parser.Core.ThenEat', V0, ('Idris.Idris2.Libraries.Text.Parser.Core':'dn--un--map_Functor_(((Grammar $state) $tok) $c)'(1, fun (V3) -> 0 end, V1)), fun () -> ('un--afterMany'(V0, V1, V2)) end}.
'un--afterMany'(V0, V1, V2) -> {'Idris.Libraries.Text.Parser.Core.Alt', V0, 1, V2, fun () -> ('un--afterSome'(V0, V1, V2)) end}.
