-module('Idris.Idris2.Libraries.Text.Lexer.Tokenizer').
-compile('no_auto_import').
-compile('inline').
-compile({'inline_size',24}).
-export([
  'case--tokenise,getFirstMatch-1974'/10,
  'case--case block in case block in case block in tokenise,getFirstMatch-1740'/27,
  'case--tokenise,getFirstMatch-1470'/14,
  'case--tokenise,getFirstMatch-1373'/10,
  'case--tokenise,getNext-1282'/11,
  'nested--4260-1186--in--un--getNext'/10,
  'nested--4260-1187--in--un--getFirstMatch'/8,
  'nested--4260-1185--in--un--getCols'/8,
  'nested--4260-1184--in--un--countNLs'/7,
  'dn--un--show_Show_StopReason'/1,
  'dn--un--showPrec_Show_StopReason'/2,
  'dn--un--pretty_Pretty_StopReason'/1,
  'dn--un--prettyPrec_Pretty_StopReason'/2,
  'dn--un--__Impl_Show_StopReason'/0,
  'dn--un--__Impl_Pretty_StopReason'/0,
  'un--tokenise'/6,
  'un--match'/2,
  'un--lexTo'/3,
  'un--lex'/2,
  'un--compose'/6,
  'un--<|>'/2
]).
'case--tokenise,getFirstMatch-1974'(V0, V1, V2, V3, V4, V5, V6, V7, V8, V9) -> case V9 of {'Idris.Prelude.Types.Right', E0} -> (fun (V10) -> {'Idris.Prelude.Types.Right', V10} end(E0)); {'Idris.Prelude.Types.Left', E1} -> (fun (V11) -> case V11 of {'Idris.Libraries.Text.Lexer.Tokenizer.ComposeNotClosing', E2, E3} -> (fun (V12, V13) -> {'Idris.Prelude.Types.Left', V11} end(E2, E3)); _ -> ('nested--4260-1187--in--un--getFirstMatch'(V0, V1, V2, V3, V4, V5, (V6()), V8)) end end(E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'case--case block in case block in case block in tokenise,getFirstMatch-1740'(V0, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26) -> case V26 of {'Idris.Prelude.Types.Just', E0} -> (fun (V27) -> case V27 of {'Idris.Builtin.MkPair', E1, E2} -> (fun (V28, V29) -> case V29 of {'Idris.Builtin.MkPair', E3, E4} -> (fun (V30, V31) -> case V31 of {'Idris.Builtin.MkPair', E5, E6} -> (fun (V32, V33) -> begin (V34 = {'Idris.Libraries.Text.Bounded.MkBounded', (V6(V28)), 0, {'Idris.Libraries.Text.Bounded.MkBounds', V22, V23, V30, V32}}), {'Idris.Prelude.Types.Right', {'Idris.Builtin.MkPair', ('Idris.Idris2.Prelude.Types.List':'un--tailRecAppend'([V34 | []], ('Idris.Idris2.Prelude.Types.List':'un--tailRecAppend'(('Idris.Idris2.Prelude.Types.List':'un--reverse'(V20)), [V19 | []])))), {'Idris.Builtin.MkPair', V30, {'Idris.Builtin.MkPair', V32, V33}}}} end end(E5, E6)); _ -> {'Idris.Prelude.Types.Left', {'Idris.Libraries.Text.Lexer.Tokenizer.ComposeNotClosing', {'Idris.Builtin.MkPair', V3, V2}, {'Idris.Builtin.MkPair', V14, V15}}} end end(E3, E4)); _ -> {'Idris.Prelude.Types.Left', {'Idris.Libraries.Text.Lexer.Tokenizer.ComposeNotClosing', {'Idris.Builtin.MkPair', V3, V2}, {'Idris.Builtin.MkPair', V14, V15}}} end end(E1, E2)); _ -> {'Idris.Prelude.Types.Left', {'Idris.Libraries.Text.Lexer.Tokenizer.ComposeNotClosing', {'Idris.Builtin.MkPair', V3, V2}, {'Idris.Builtin.MkPair', V14, V15}}} end end(E0)); _ -> {'Idris.Prelude.Types.Left', {'Idris.Libraries.Text.Lexer.Tokenizer.ComposeNotClosing', {'Idris.Builtin.MkPair', V3, V2}, {'Idris.Builtin.MkPair', V14, V15}}} end.
'case--tokenise,getFirstMatch-1470'(V0, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13) -> case V13 of {'Idris.Prelude.Types.Just', E0} -> (fun (V14) -> case V14 of {'Idris.Builtin.MkPair', E1, E2} -> (fun (V15, V16) -> case V16 of {'Idris.Builtin.MkPair', E3, E4} -> (fun (V17, V18) -> case V18 of {'Idris.Builtin.MkPair', E5, E6} -> (fun (V19, V20) -> begin (V21 = (V9(V15))), begin (V22 = ((V8())(V21))), begin (V23 = (V7(V21))), begin (V24 = {'Idris.Libraries.Text.Bounded.MkBounded', (V10(V15)), 0, {'Idris.Libraries.Text.Bounded.MkBounds', V3, V2, V17, V19}}), case ('un--tokenise'(V23, V22, V17, V19, [], V20)) of {'Idris.Builtin.MkPair', E7, E8} -> (fun (V25, V26) -> case V26 of {'Idris.Builtin.MkPair', E9, E10} -> (fun (V27, V28) -> case V28 of {'Idris.Builtin.MkPair', E11, E12} -> (fun (V29, V30) -> case V30 of {'Idris.Builtin.MkPair', E13, E14} -> (fun (V31, V32) -> case V27 of {'Idris.Libraries.Text.Lexer.Tokenizer.ComposeNotClosing', E15, E16} -> (fun (V33, V34) -> {'Idris.Prelude.Types.Left', V27} end(E15, E16)); _ -> ('case--case block in case block in case block in tokenise,getFirstMatch-1740'(V0, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V15, V17, V19, V20, V22, V23, V24, V25, V27, V29, V31, V32, V21, ('nested--4260-1186--in--un--getNext'(V0, V1, V2, V3, V4, V5, V23, V29, V31, V32)))) end end(E13, E14)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E11, E12)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E9, E10)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E7, E8)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end end end end(E5, E6)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E3, E4)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E1, E2)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E0)); {'Idris.Prelude.Types.Nothing'} -> (fun () -> {'Idris.Prelude.Types.Left', {'Idris.Libraries.Text.Lexer.Tokenizer.NoRuleApply'}} end()); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'case--tokenise,getFirstMatch-1373'(V0, V1, V2, V3, V4, V5, V6, V7, V8, V9) -> case V9 of {'Idris.Prelude.Types.Just', E0} -> (fun (V10) -> case V10 of {'Idris.Builtin.MkPair', E1, E2} -> (fun (V11, V12) -> case V12 of {'Idris.Builtin.MkPair', E3, E4} -> (fun (V13, V14) -> case V14 of {'Idris.Builtin.MkPair', E5, E6} -> (fun (V15, V16) -> begin (V17 = {'Idris.Libraries.Text.Bounded.MkBounded', (V6(V11)), 0, {'Idris.Libraries.Text.Bounded.MkBounds', V3, V2, V13, V15}}), {'Idris.Prelude.Types.Right', {'Idris.Builtin.MkPair', [V17 | []], {'Idris.Builtin.MkPair', V13, {'Idris.Builtin.MkPair', V15, V16}}}} end end(E5, E6)); _ -> {'Idris.Prelude.Types.Left', {'Idris.Libraries.Text.Lexer.Tokenizer.NoRuleApply'}} end end(E3, E4)); _ -> {'Idris.Prelude.Types.Left', {'Idris.Libraries.Text.Lexer.Tokenizer.NoRuleApply'}} end end(E1, E2)); _ -> {'Idris.Prelude.Types.Left', {'Idris.Libraries.Text.Lexer.Tokenizer.NoRuleApply'}} end end(E0)); _ -> {'Idris.Prelude.Types.Left', {'Idris.Libraries.Text.Lexer.Tokenizer.NoRuleApply'}} end.
'case--tokenise,getNext-1282'(V0, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10) -> case V10 of {'Idris.Prelude.Types.Just', E0} -> (fun (V11) -> case V11 of {'Idris.Builtin.MkPair', E1, E2} -> (fun (V12, V13) -> begin (V14 = ((V8 + ('Idris.Idris2.Prelude.Cast':'dn--un--cast_Cast_Nat_Int'(('nested--4260-1184--in--un--countNLs'(V0, V1, V2, V3, V4, V5, V12))))) rem 9223372036854775808)), begin (V15 = ('nested--4260-1185--in--un--getCols'(V0, V1, V2, V3, V4, V5, V12, V7))), begin (V16 = ('Idris.Idris2.Prelude.Types':'un--fastPack'(('Idris.Idris2.Prelude.Types.List':'un--reverse'(V12))))), ('Idris.Idris2.Prelude.Types':'dn--un--pure_Applicative_Maybe'({'Idris.Builtin.MkPair', V16, {'Idris.Builtin.MkPair', V14, {'Idris.Builtin.MkPair', V15, V13}}})) end end end end(E1, E2)); _ -> {'Idris.Prelude.Types.Nothing'} end end(E0)); _ -> {'Idris.Prelude.Types.Nothing'} end.
'nested--4260-1186--in--un--getNext'(V0, V1, V2, V3, V4, V5, V6, V7, V8, V9) -> ('case--tokenise,getNext-1282'(V0, V1, V2, V3, V4, V5, V9, V8, V7, V6, ('Idris.Idris2.Libraries.Text.Lexer.Core':'un--scan'(V6, [], V9)))).
'nested--4260-1187--in--un--getFirstMatch'(V0, V1, V2, V3, V4, V5, V6, V7) -> case V6 of {'Idris.Libraries.Text.Lexer.Tokenizer.Match', E0, E1} -> (fun (V8, V9) -> ('case--tokenise,getFirstMatch-1373'(V0, V1, V2, V3, V4, V5, V9, V8, V7, ('nested--4260-1186--in--un--getNext'(V0, V1, V2, V3, V4, V5, V8, V3, V2, V7)))) end(E0, E1)); {'Idris.Libraries.Text.Lexer.Tokenizer.Compose', E2, E3, E4, E5, E6, E7} -> (fun (V10, V11, V12, V13, V14, V15) -> ('case--tokenise,getFirstMatch-1470'(V0, V1, V2, V3, V4, V5, V15, V14, V13, V12, V11, V10, V7, ('nested--4260-1186--in--un--getNext'(V0, V1, V2, V3, V4, V5, V10, V3, V2, V7)))) end(E2, E3, E4, E5, E6, E7)); {'Idris.Libraries.Text.Lexer.Tokenizer.Alt', E8, E9} -> (fun (V16, V17) -> ('case--tokenise,getFirstMatch-1974'(V0, V1, V2, V3, V4, V5, V17, V16, V7, ('nested--4260-1187--in--un--getFirstMatch'(V0, V1, V2, V3, V4, V5, V16, V7)))) end(E8, E9)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'nested--4260-1185--in--un--getCols'(V0, V1, V2, V3, V4, V5, V6, V7) -> case ('Idris.Idris2.Data.List':'un--span'(fun (V8) -> ('Idris.Idris2.Prelude.EqOrd':'dn--un--/=_Eq_Char'(V8, $\x{a})) end, V6)) of {'Idris.Builtin.MkPair', E0, E1} -> (fun (V9, V10) -> case V10 of [] -> ((V7 + ('Idris.Idris2.Prelude.Cast':'dn--un--cast_Cast_Nat_Int'(('Idris.Idris2.Prelude.Types.List':'un--length'(V9))))) rem 9223372036854775808); _ -> ('Idris.Idris2.Prelude.Cast':'dn--un--cast_Cast_Nat_Int'(('Idris.Idris2.Prelude.Types.List':'un--length'(V9)))) end end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'nested--4260-1184--in--un--countNLs'(V0, V1, V2, V3, V4, V5, V6) -> ('Idris.Idris2.Prelude.Types.List':'un--length'(('Idris.Idris2.Data.List':'un--filter'(fun (V7) -> ('Idris.Idris2.Prelude.EqOrd':'dn--un--==_Eq_Char'(V7, $\x{a})) end, V6)))).
'dn--un--show_Show_StopReason'(V0) -> case V0 of {'Idris.Libraries.Text.Lexer.Tokenizer.EndInput'} -> (fun () -> <<"EndInput"/utf8>> end()); {'Idris.Libraries.Text.Lexer.Tokenizer.NoRuleApply'} -> (fun () -> <<"NoRuleApply"/utf8>> end()); {'Idris.Libraries.Text.Lexer.Tokenizer.ComposeNotClosing', E0, E1} -> (fun (V1, V2) -> ('Idris.Idris2.Prelude.Types.String':'un--++'(<<"ComposeNotClosing "/utf8>>, ('Idris.Idris2.Prelude.Types.String':'un--++'(('Idris.Idris2.Prelude.Show':'dn--un--show_Show_(|((Builtin.Pair $a) $b),((Builtin.MkPair $a) $b)|)'({'Idris.Builtin.MkPair', {'Idris.Prelude.Show.MkShow', fun (V3) -> ('Idris.Idris2.Prelude.Show':'dn--un--show_Show_Int'(V3)) end, fun (V4) -> fun (V5) -> ('Idris.Idris2.Prelude.Show':'dn--un--showPrec_Show_Int'(V4, V5)) end end}, {'Idris.Prelude.Show.MkShow', fun (V6) -> ('Idris.Idris2.Prelude.Show':'dn--un--show_Show_Int'(V6)) end, fun (V7) -> fun (V8) -> ('Idris.Idris2.Prelude.Show':'dn--un--showPrec_Show_Int'(V7, V8)) end end}}, V1)), ('Idris.Idris2.Prelude.Types.String':'un--++'(<<" "/utf8>>, ('Idris.Idris2.Prelude.Show':'dn--un--show_Show_(|((Builtin.Pair $a) $b),((Builtin.MkPair $a) $b)|)'({'Idris.Builtin.MkPair', {'Idris.Prelude.Show.MkShow', fun (V9) -> ('Idris.Idris2.Prelude.Show':'dn--un--show_Show_Int'(V9)) end, fun (V10) -> fun (V11) -> ('Idris.Idris2.Prelude.Show':'dn--un--showPrec_Show_Int'(V10, V11)) end end}, {'Idris.Prelude.Show.MkShow', fun (V12) -> ('Idris.Idris2.Prelude.Show':'dn--un--show_Show_Int'(V12)) end, fun (V13) -> fun (V14) -> ('Idris.Idris2.Prelude.Show':'dn--un--showPrec_Show_Int'(V13, V14)) end end}}, V2)))))))) end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'dn--un--showPrec_Show_StopReason'(V0, V1) -> ('dn--un--show_Show_StopReason'(V1)).
'dn--un--pretty_Pretty_StopReason'(V0) -> case V0 of {'Idris.Libraries.Text.Lexer.Tokenizer.EndInput'} -> (fun () -> ('Idris.Idris2.Libraries.Text.PrettyPrint.Prettyprinter.Doc':'dn--un--pretty_Pretty_String'(<<"EndInput"/utf8>>)) end()); {'Idris.Libraries.Text.Lexer.Tokenizer.NoRuleApply'} -> (fun () -> ('Idris.Idris2.Libraries.Text.PrettyPrint.Prettyprinter.Doc':'dn--un--pretty_Pretty_String'(<<"NoRuleApply"/utf8>>)) end()); {'Idris.Libraries.Text.Lexer.Tokenizer.ComposeNotClosing', E0, E1} -> (fun (V1, V2) -> ('Idris.Idris2.Libraries.Text.PrettyPrint.Prettyprinter.Doc':'un--<++>'(('Idris.Idris2.Libraries.Text.PrettyPrint.Prettyprinter.Doc':'dn--un--fromString_FromString_(Doc $ann)'(<<"ComposeNotClosing"/utf8>>)), ('Idris.Idris2.Libraries.Text.PrettyPrint.Prettyprinter.Doc':'un--<++>'(('Idris.Idris2.Libraries.Text.PrettyPrint.Prettyprinter.Doc':'dn--un--pretty_Pretty_(|((Builtin.Pair $a) $b),((Builtin.MkPair $a) $b)|)'({'Idris.Builtin.MkPair', {'Idris.Libraries.Text.PrettyPrint.Prettyprinter.Doc.dn--un--__mkPretty', fun (V3) -> fun (V4) -> ('Idris.Idris2.Libraries.Text.PrettyPrint.Prettyprinter.Doc':'dn--un--pretty_Pretty_Int'(V4)) end end, fun (V5) -> fun (V6) -> fun (V7) -> ('Idris.Idris2.Libraries.Text.PrettyPrint.Prettyprinter.Doc':'dn--un--prettyPrec_Pretty_Int'(V6, V7)) end end end}, {'Idris.Libraries.Text.PrettyPrint.Prettyprinter.Doc.dn--un--__mkPretty', fun (V8) -> fun (V9) -> ('Idris.Idris2.Libraries.Text.PrettyPrint.Prettyprinter.Doc':'dn--un--pretty_Pretty_Int'(V9)) end end, fun (V10) -> fun (V11) -> fun (V12) -> ('Idris.Idris2.Libraries.Text.PrettyPrint.Prettyprinter.Doc':'dn--un--prettyPrec_Pretty_Int'(V11, V12)) end end end}}, V1)), ('Idris.Idris2.Libraries.Text.PrettyPrint.Prettyprinter.Doc':'dn--un--pretty_Pretty_(|((Builtin.Pair $a) $b),((Builtin.MkPair $a) $b)|)'({'Idris.Builtin.MkPair', {'Idris.Libraries.Text.PrettyPrint.Prettyprinter.Doc.dn--un--__mkPretty', fun (V13) -> fun (V14) -> ('Idris.Idris2.Libraries.Text.PrettyPrint.Prettyprinter.Doc':'dn--un--pretty_Pretty_Int'(V14)) end end, fun (V15) -> fun (V16) -> fun (V17) -> ('Idris.Idris2.Libraries.Text.PrettyPrint.Prettyprinter.Doc':'dn--un--prettyPrec_Pretty_Int'(V16, V17)) end end end}, {'Idris.Libraries.Text.PrettyPrint.Prettyprinter.Doc.dn--un--__mkPretty', fun (V18) -> fun (V19) -> ('Idris.Idris2.Libraries.Text.PrettyPrint.Prettyprinter.Doc':'dn--un--pretty_Pretty_Int'(V19)) end end, fun (V20) -> fun (V21) -> fun (V22) -> ('Idris.Idris2.Libraries.Text.PrettyPrint.Prettyprinter.Doc':'dn--un--prettyPrec_Pretty_Int'(V21, V22)) end end end}}, V2)))))) end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'dn--un--prettyPrec_Pretty_StopReason'(V0, V1) -> ('dn--un--pretty_Pretty_StopReason'(V1)).
'dn--un--__Impl_Show_StopReason'() -> {'Idris.Prelude.Show.MkShow', fun (V0) -> ('dn--un--show_Show_StopReason'(V0)) end, fun (V1) -> fun (V2) -> ('dn--un--showPrec_Show_StopReason'(V1, V2)) end end}.
'dn--un--__Impl_Pretty_StopReason'() -> {'Idris.Libraries.Text.PrettyPrint.Prettyprinter.Doc.dn--un--__mkPretty', fun (V0) -> fun (V1) -> ('dn--un--pretty_Pretty_StopReason'(V1)) end end, fun (V2) -> fun (V3) -> fun (V4) -> ('dn--un--prettyPrec_Pretty_StopReason'(V3, V4)) end end end}.
'un--tokenise'(V0, V1, V2, V3, V4, V5) -> case V5 of [] -> {'Idris.Builtin.MkPair', ('Idris.Idris2.Prelude.Types.List':'un--reverse'(V4)), {'Idris.Builtin.MkPair', {'Idris.Libraries.Text.Lexer.Tokenizer.EndInput'}, {'Idris.Builtin.MkPair', V2, {'Idris.Builtin.MkPair', V3, []}}}}; _ -> case ('Idris.Idris2.Libraries.Text.Lexer.Core':'un--scan'(V0, [], V5)) of {'Idris.Prelude.Types.Just', E0} -> (fun (V6) -> {'Idris.Builtin.MkPair', ('Idris.Idris2.Prelude.Types.List':'un--reverse'(V4)), {'Idris.Builtin.MkPair', {'Idris.Libraries.Text.Lexer.Tokenizer.EndInput'}, {'Idris.Builtin.MkPair', V2, {'Idris.Builtin.MkPair', V3, V5}}}} end(E0)); {'Idris.Prelude.Types.Nothing'} -> (fun () -> case ('nested--4260-1187--in--un--getFirstMatch'(V5, V4, V3, V2, V1, V0, V1, V5)) of {'Idris.Prelude.Types.Right', E1} -> (fun (V7) -> case V7 of {'Idris.Builtin.MkPair', E2, E3} -> (fun (V8, V9) -> case V9 of {'Idris.Builtin.MkPair', E4, E5} -> (fun (V10, V11) -> case V11 of {'Idris.Builtin.MkPair', E6, E7} -> (fun (V12, V13) -> ('un--tokenise'(V0, V1, V10, V12, ('Idris.Idris2.Prelude.Types.List':'un--tailRecAppend'(V8, V4)), V13)) end(E6, E7)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E4, E5)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E2, E3)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E1)); {'Idris.Prelude.Types.Left', E8} -> (fun (V14) -> {'Idris.Builtin.MkPair', ('Idris.Idris2.Prelude.Types.List':'un--reverse'(V4)), {'Idris.Builtin.MkPair', V14, {'Idris.Builtin.MkPair', V2, {'Idris.Builtin.MkPair', V3, V5}}}} end(E8)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end()); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end.
'un--match'(V0, V1) -> {'Idris.Libraries.Text.Lexer.Tokenizer.Match', V0, V1}.
'un--lexTo'(V0, V1, V2) -> case ('un--tokenise'(V0, V1, 0, 0, [], ('Idris.Idris2.Prelude.Types':'un--fastUnpack'(V2)))) of {'Idris.Builtin.MkPair', E0, E1} -> (fun (V3, V4) -> case V4 of {'Idris.Builtin.MkPair', E2, E3} -> (fun (V5, V6) -> case V6 of {'Idris.Builtin.MkPair', E4, E5} -> (fun (V7, V8) -> case V8 of {'Idris.Builtin.MkPair', E6, E7} -> (fun (V9, V10) -> {'Idris.Builtin.MkPair', V3, {'Idris.Builtin.MkPair', V5, {'Idris.Builtin.MkPair', V7, {'Idris.Builtin.MkPair', V9, ('Idris.Idris2.Prelude.Types':'un--fastPack'(V10))}}}} end(E6, E7)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E4, E5)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E2, E3)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--lex'(V0, V1) -> ('un--lexTo'(('Idris.Idris2.Libraries.Text.Lexer.Core':'un--pred'(fun (V2) -> 0 end)), V0, V1)).
'un--compose'(V0, V1, V2, V3, V4, V5) -> {'Idris.Libraries.Text.Lexer.Tokenizer.Compose', V0, V1, V2, V3, V4, V5}.
'un--<|>'(V0, V1) -> {'Idris.Libraries.Text.Lexer.Tokenizer.Alt', V0, V1}.
