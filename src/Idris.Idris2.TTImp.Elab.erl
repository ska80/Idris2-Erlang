-module('Idris.Idris2.TTImp.Elab').
-compile('no_auto_import').
-compile('inline').
-compile({'inline_size',24}).
-export([
  'case--doPLetRenames-9409'/8,
  'case--findPLetRenames-9240'/11,
  'nested--9396-9497--in--un--updateType'/6,
  'nested--9396-9498--in--un--normaliseH'/5,
  'nested--11422-11228--in--un--bindImps\x{27}'/20,
  'nested--11422-11229--in--un--bindImps'/19,
  'nested--9601-9703--in--un--addHoles'/17,
  'un--normaliseHoleTypes'/3,
  'un--getRigNeeded'/1,
  'un--findPLetRenames'/2,
  'un--elabTermSub'/14,
  'un--elabTerm'/11,
  'un--doPLetRenames'/4,
  'un--checkTermSub'/15,
  'un--checkTerm'/12,
  'un--addHoleToSave'/3
]).
'case--doPLetRenames-9409'(V0, V1, V2, V3, V4, V5, V6, V7) -> case V7 of {'Idris.Prelude.Types.Just', E0} -> (fun (V8) -> case V8 of {'Idris.Builtin.MkPair', E1, E2} -> (fun (V9, V10) -> {'Idris.Core.TT.Bind', V4, V10, ('Idris.Idris2.Core.TT':'un--setMultiplicity'(V3, ('Idris.Idris2.Algebra.Preorder':'un--lub'({'Idris.Algebra.Preorder.dn--un--__mkPreorder', fun (V11) -> fun (V12) -> ('Idris.Idris2.Algebra.ZeroOneOmega':'dn--un--<=_Preorder_ZeroOneOmega'(V11, V12)) end end, fun (V13) -> ('Idris.Idris2.Algebra.ZeroOneOmega':'dn--un--preorderRefl_Preorder_ZeroOneOmega'(V13)) end, fun (V14) -> fun (V15) -> fun (V16) -> fun (V17) -> fun (V18) -> ('Idris.Idris2.Algebra.ZeroOneOmega':'dn--un--preorderTrans_Preorder_ZeroOneOmega'(V14, V15, V16, V17, V18)) end end end end end}, V9, ('Idris.Idris2.Core.TT':'un--multiplicity'(V3)))))), ('un--doPLetRenames'([V10 | V0], V6, [V10 | V5], ('Idris.Idris2.Core.TT':'un--renameTop'(V10, V2))))} end(E1, E2)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E0)); {'Idris.Prelude.Types.Nothing'} -> (fun () -> {'Idris.Core.TT.Bind', V4, V1, V3, ('un--doPLetRenames'([V1 | V0], V6, V5, V2))} end()); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'case--findPLetRenames-9240'(V0, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10) -> case V10 of {'Idris.Core.Name.MN', E0, E1} -> (fun (V11, V12) -> [{'Idris.Builtin.MkPair', V10, {'Idris.Builtin.MkPair', V6, V7}} | ('un--findPLetRenames'([V7 | V0], V8))] end(E0, E1)); _ -> ('un--findPLetRenames'([V7 | V0], V8)) end.
'nested--9396-9497--in--un--updateType'(V0, V1, V2, V3, V4, V5) -> begin (V49 = ('Idris.Idris2.Core.Core':'dn--un--catch_Catchable_Core_Error'(fun (V6) -> ('Idris.Idris2.Core.Normalise':'un--tryNormaliseSizeLimit'(V1, [], V2, (1 + (1 + (1 + (1 + (1 + (1 + (1 + (1 + (1 + (1 + 0)))))))))), {'Idris.Core.Env.Nil'}, case V4 of {'Idris.Core.Context.Context.MkGlobalDef', E0, E1, E2, E3, E4, E5, E6, E7, E8, E9, E10, E11, E12, E13, E14, E15, E16, E17, E18, E19} -> (fun (V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26) -> V9 end(E0, E1, E2, E3, E4, E5, E6, E7, E8, E9, E10, E11, E12, E13, E14, E15, E16, E17, E18, E19)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end, V6)) end, fun (V27) -> fun (V28) -> ('Idris.Idris2.Core.Normalise':'un--normaliseHoles'(V1, [], V2, {'Idris.Core.Env.Nil'}, case V4 of {'Idris.Core.Context.Context.MkGlobalDef', E20, E21, E22, E23, E24, E25, E26, E27, E28, E29, E30, E31, E32, E33, E34, E35, E36, E37, E38, E39} -> (fun (V29, V30, V31, V32, V33, V34, V35, V36, V37, V38, V39, V40, V41, V42, V43, V44, V45, V46, V47, V48) -> V31 end(E20, E21, E22, E23, E24, E25, E26, E27, E28, E29, E30, E31, E32, E33, E34, E35, E36, E37, E38, E39)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end, V28)) end end, V5))), case V49 of {'Idris.Prelude.Types.Left', E40} -> (fun (V50) -> {'Idris.Prelude.Types.Left', V50} end(E40)); {'Idris.Prelude.Types.Right', E41} -> (fun (V51) -> ('Idris.Idris2.Prelude.IO':'dn--un--map_Functor_IO'(fun (V52) -> case V52 of {'Idris.Prelude.Types.Left', E42} -> (fun (V53) -> {'Idris.Prelude.Types.Left', V53} end(E42)); {'Idris.Prelude.Types.Right', E43} -> (fun (V54) -> {'Idris.Prelude.Types.Right', 0} end(E43)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end, fun (V55) -> ('Idris.Idris2.Core.Context':'un--addDef'(V1, {'Idris.Core.Name.Resolved', V3}, case V4 of {'Idris.Core.Context.Context.MkGlobalDef', E44, E45, E46, E47, E48, E49, E50, E51, E52, E53, E54, E55, E56, E57, E58, E59, E60, E61, E62, E63} -> (fun (V56, V57, V58, V59, V60, V61, V62, V63, V64, V65, V66, V67, V68, V69, V70, V71, V72, V73, V74, V75) -> {'Idris.Core.Context.Context.MkGlobalDef', V56, V57, V51, V59, V60, V61, V62, V63, V64, V65, V66, V67, V68, V69, V70, V71, V72, V73, V74, V75} end(E44, E45, E46, E47, E48, E49, E50, E51, E52, E53, E54, E55, E56, E57, E58, E59, E60, E61, E62, E63)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end, V55)) end, V5)) end(E41)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end.
'nested--9396-9498--in--un--normaliseH'(V0, V1, V2, V3, V4) -> begin (V35 = (('Idris.Idris2.Core.Context':'un--lookupCtxtExact'({'Idris.Core.Name.Resolved', V3}, case V2 of {'Idris.Core.Context.MkDefs', E0, E1, E2, E3, E4, E5, E6, E7, E8, E9, E10, E11, E12, E13, E14, E15, E16, E17, E18, E19, E20, E21, E22, E23, E24, E25, E26, E27, E28, E29} -> (fun (V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34) -> V5 end(E0, E1, E2, E3, E4, E5, E6, E7, E8, E9, E10, E11, E12, E13, E14, E15, E16, E17, E18, E19, E20, E21, E22, E23, E24, E25, E26, E27, E28, E29)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end))(V4))), case V35 of {'Idris.Prelude.Types.Left', E30} -> (fun (V36) -> {'Idris.Prelude.Types.Left', V36} end(E30)); {'Idris.Prelude.Types.Right', E31} -> (fun (V37) -> case V37 of {'Idris.Prelude.Types.Just', E32} -> (fun (V38) -> case V38 of {'Idris.Core.Context.Context.MkGlobalDef', E33, E34, E35, E36, E37, E38, E39, E40, E41, E42, E43, E44, E45, E46, E47, E48, E49, E50, E51, E52} -> (fun (V39, V40, V41, V42, V43, V44, V45, V46, V47, V48, V49, V50, V51, V52, V53, V54, V55, V56, V57, V58) -> case V56 of {'Idris.Core.Context.Context.Hole', E53, E54} -> (fun (V59, V60) -> ('nested--9396-9497--in--un--updateType'(V0, V1, V2, V3, V38, V4)) end(E53, E54)); _ -> {'Idris.Prelude.Types.Right', 0} end end(E33, E34, E35, E36, E37, E38, E39, E40, E41, E42, E43, E44, E45, E46, E47, E48, E49, E50, E51, E52)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E32)); {'Idris.Prelude.Types.Nothing'} -> (fun () -> {'Idris.Prelude.Types.Right', 0} end()); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E31)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end.
'nested--11422-11228--in--un--bindImps\x{27}'(V0, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19) -> case V17 of [] -> {'Idris.Prelude.Types.Right', V18}; [E0 | E1] -> (fun (V20, V21) -> case V20 of {'Idris.Builtin.MkPair', E2, E3} -> (fun (V22, V23) -> begin (V24 = ('nested--11422-11228--in--un--bindImps\x{27}'(V0, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V21, V18, V19))), case V24 of {'Idris.Prelude.Types.Left', E4} -> (fun (V25) -> {'Idris.Prelude.Types.Left', V25} end(E4)); {'Idris.Prelude.Types.Right', E5} -> (fun (V26) -> {'Idris.Prelude.Types.Right', {'Idris.TTImp.TTImp.IPi', V15, ('Idris.Idris2.Algebra.Semiring':'un--erased'({'Idris.Algebra.Semiring.dn--un--__mkSemiring', fun (V27) -> fun (V28) -> ('Idris.Idris2.Algebra.ZeroOneOmega':'dn--un--|+|_Semiring_ZeroOneOmega'(V27, V28)) end end, ('Idris.Idris2.Algebra.ZeroOneOmega':'dn--un--plusNeutral_Semiring_ZeroOneOmega'()), fun (V29) -> fun (V30) -> ('Idris.Idris2.Algebra.ZeroOneOmega':'dn--un--|*|_Semiring_ZeroOneOmega'(V29, V30)) end end, ('Idris.Idris2.Algebra.ZeroOneOmega':'dn--un--timesNeutral_Semiring_ZeroOneOmega'())})), {'Idris.Core.TT.Implicit'}, {'Idris.Prelude.Types.Just', V22}, {'Idris.TTImp.TTImp.Implicit', V15, 1}, V26}} end(E5)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E2, E3)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'nested--11422-11229--in--un--bindImps'(V0, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18) -> case V18 of {'Idris.TTImp.TTImp.IBindHere', E0, E1, E2} -> (fun (V19, V20, V21) -> fun (V22) -> begin (V23 = ('nested--11422-11228--in--un--bindImps\x{27}'(V0, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V21, V22))), case V23 of {'Idris.Prelude.Types.Left', E3} -> (fun (V24) -> {'Idris.Prelude.Types.Left', V24} end(E3)); {'Idris.Prelude.Types.Right', E4} -> (fun (V25) -> {'Idris.Prelude.Types.Right', {'Idris.TTImp.TTImp.IBindHere', V19, V20, V25}} end(E4)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end end(E0, E1, E2)); _ -> fun (V26) -> ('nested--11422-11228--in--un--bindImps\x{27}'(V0, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V26)) end end.
'nested--9601-9703--in--un--addHoles'(V0, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16) -> case V16 of [] -> V14; [E0 | E1] -> (fun (V17, V18) -> case V17 of {'Idris.Builtin.MkPair', E2, E3} -> (fun (V19, V20) -> case ('Idris.Idris2.Libraries.Data.IntMap':'un--lookup'(V19, V15)) of {'Idris.Prelude.Types.Nothing'} -> (fun () -> ('nested--9601-9703--in--un--addHoles'(V0, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V18)) end()); {'Idris.Prelude.Types.Just', E4} -> (fun (V21) -> ('nested--9601-9703--in--un--addHoles'(V0, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, ('Idris.Idris2.Libraries.Data.IntMap':'un--insert'(V19, V20, V14)), V15, V18)) end(E4)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E2, E3)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--normaliseHoleTypes'(V0, V1, V2) -> begin (V4 = begin (V3 = ('erlang':'get'(V1))), {'Idris.Prelude.Types.Right', V3} end), case V4 of {'Idris.Prelude.Types.Left', E0} -> (fun (V5) -> {'Idris.Prelude.Types.Left', V5} end(E0)); {'Idris.Prelude.Types.Right', E1} -> (fun (V6) -> begin (V19 = ('Idris.Idris2.Libraries.Data.IntMap':'un--keys'(case V6 of {'Idris.Core.UnifyState.MkUState', E2, E3, E4, E5, E6, E7, E8, E9, E10, E11, E12, E13} -> (fun (V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18) -> V7 end(E2, E3, E4, E5, E6, E7, E8, E9, E10, E11, E12, E13)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end))), begin (V21 = begin (V20 = ('erlang':'get'(V0))), {'Idris.Prelude.Types.Right', V20} end), case V21 of {'Idris.Prelude.Types.Left', E14} -> (fun (V22) -> {'Idris.Prelude.Types.Left', V22} end(E14)); {'Idris.Prelude.Types.Right', E15} -> (fun (V23) -> ('Idris.Idris2.Core.Core':'un--traverse_'(fun (V24) -> fun (V25) -> ('nested--9396-9498--in--un--normaliseH'(V1, V0, V23, V24, V25)) end end, V19, V2)) end(E15)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end end(E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end.
'un--getRigNeeded'(V0) -> case V0 of {'Idris.TTImp.Elab.Check.InType'} -> (fun () -> ('Idris.Idris2.Algebra.Semiring':'un--erased'({'Idris.Algebra.Semiring.dn--un--__mkSemiring', fun (V1) -> fun (V2) -> ('Idris.Idris2.Algebra.ZeroOneOmega':'dn--un--|+|_Semiring_ZeroOneOmega'(V1, V2)) end end, ('Idris.Idris2.Algebra.ZeroOneOmega':'dn--un--plusNeutral_Semiring_ZeroOneOmega'()), fun (V3) -> fun (V4) -> ('Idris.Idris2.Algebra.ZeroOneOmega':'dn--un--|*|_Semiring_ZeroOneOmega'(V3, V4)) end end, ('Idris.Idris2.Algebra.ZeroOneOmega':'dn--un--timesNeutral_Semiring_ZeroOneOmega'())})) end()); {'Idris.TTImp.Elab.Check.InLHS', E0} -> (fun (V5) -> case ('Idris.Idris2.Algebra.Semiring':'un--isErased'({'Idris.Builtin.MkPair', {'Idris.Algebra.Semiring.dn--un--__mkSemiring', fun (V6) -> fun (V7) -> ('Idris.Idris2.Algebra.ZeroOneOmega':'dn--un--|+|_Semiring_ZeroOneOmega'(V6, V7)) end end, ('Idris.Idris2.Algebra.ZeroOneOmega':'dn--un--plusNeutral_Semiring_ZeroOneOmega'()), fun (V8) -> fun (V9) -> ('Idris.Idris2.Algebra.ZeroOneOmega':'dn--un--|*|_Semiring_ZeroOneOmega'(V8, V9)) end end, ('Idris.Idris2.Algebra.ZeroOneOmega':'dn--un--timesNeutral_Semiring_ZeroOneOmega'())}, {'Idris.Prelude.EqOrd.MkEq', fun (V10) -> fun (V11) -> ('Idris.Idris2.Algebra.ZeroOneOmega':'dn--un--==_Eq_ZeroOneOmega'(V10, V11)) end end, fun (V12) -> fun (V13) -> ('Idris.Idris2.Algebra.ZeroOneOmega':'dn--un--/=_Eq_ZeroOneOmega'(V12, V13)) end end}}, V5)) of 1 -> ('Idris.Idris2.Algebra.Semiring':'un--erased'({'Idris.Algebra.Semiring.dn--un--__mkSemiring', fun (V14) -> fun (V15) -> ('Idris.Idris2.Algebra.ZeroOneOmega':'dn--un--|+|_Semiring_ZeroOneOmega'(V14, V15)) end end, ('Idris.Idris2.Algebra.ZeroOneOmega':'dn--un--plusNeutral_Semiring_ZeroOneOmega'()), fun (V16) -> fun (V17) -> ('Idris.Idris2.Algebra.ZeroOneOmega':'dn--un--|*|_Semiring_ZeroOneOmega'(V16, V17)) end end, ('Idris.Idris2.Algebra.ZeroOneOmega':'dn--un--timesNeutral_Semiring_ZeroOneOmega'())})); 0 -> ('Idris.Idris2.Algebra.Semiring':'un--linear'({'Idris.Algebra.Semiring.dn--un--__mkSemiring', fun (V18) -> fun (V19) -> ('Idris.Idris2.Algebra.ZeroOneOmega':'dn--un--|+|_Semiring_ZeroOneOmega'(V18, V19)) end end, ('Idris.Idris2.Algebra.ZeroOneOmega':'dn--un--plusNeutral_Semiring_ZeroOneOmega'()), fun (V20) -> fun (V21) -> ('Idris.Idris2.Algebra.ZeroOneOmega':'dn--un--|*|_Semiring_ZeroOneOmega'(V20, V21)) end end, ('Idris.Idris2.Algebra.ZeroOneOmega':'dn--un--timesNeutral_Semiring_ZeroOneOmega'())})); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E0)); _ -> ('Idris.Idris2.Algebra.Semiring':'un--linear'({'Idris.Algebra.Semiring.dn--un--__mkSemiring', fun (V22) -> fun (V23) -> ('Idris.Idris2.Algebra.ZeroOneOmega':'dn--un--|+|_Semiring_ZeroOneOmega'(V22, V23)) end end, ('Idris.Idris2.Algebra.ZeroOneOmega':'dn--un--plusNeutral_Semiring_ZeroOneOmega'()), fun (V24) -> fun (V25) -> ('Idris.Idris2.Algebra.ZeroOneOmega':'dn--un--|*|_Semiring_ZeroOneOmega'(V24, V25)) end end, ('Idris.Idris2.Algebra.ZeroOneOmega':'dn--un--timesNeutral_Semiring_ZeroOneOmega'())})) end.
'un--findPLetRenames'(V0, V1) -> case V1 of {'Idris.Core.TT.Bind', E0, E1, E2, E3} -> (fun (V2, V3, V4, V5) -> case V4 of {'Idris.Core.TT.PLet', E4, E5, E6, E7} -> (fun (V6, V7, V8, V9) -> case V8 of {'Idris.Core.TT.Local', E8, E9, E10} -> (fun (V10, V11, V12) -> ('case--findPLetRenames-9240'(V0, V6, V10, V11, V12, V9, V7, V3, V5, V2, ('Idris.Idris2.Core.TT':'un--nameAt'(V0, V12)))) end(E8, E9, E10)); _ -> ('un--findPLetRenames'([V3 | V0], V5)) end end(E4, E5, E6, E7)); _ -> ('un--findPLetRenames'([V3 | V0], V5)) end end(E0, E1, E2, E3)); _ -> [] end.
'un--elabTermSub'(V0, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13) -> begin (V18 = ('Idris.Idris2.Prelude.Types':'un--elem'({'Idris.Prelude.EqOrd.MkEq', fun (V14) -> fun (V15) -> ('Idris.Idris2.TTImp.Elab.Check':'dn--un--==_Eq_ElabOpt'(V14, V15)) end end, fun (V16) -> fun (V17) -> ('Idris.Idris2.TTImp.Elab.Check':'dn--un--/=_Eq_ElabOpt'(V16, V17)) end end}, 1, V7))), begin (V23 = ('Idris.Idris2.Prelude.Types':'un--elem'({'Idris.Prelude.EqOrd.MkEq', fun (V19) -> fun (V20) -> ('Idris.Idris2.TTImp.Elab.Check':'dn--un--==_Eq_ElabOpt'(V19, V20)) end end, fun (V21) -> fun (V22) -> ('Idris.Idris2.TTImp.Elab.Check':'dn--un--/=_Eq_ElabOpt'(V21, V22)) end end}, 2, V7))), begin (V28 = ('Idris.Idris2.Prelude.Types':'un--elem'({'Idris.Prelude.EqOrd.MkEq', fun (V24) -> fun (V25) -> ('Idris.Idris2.TTImp.Elab.Check':'dn--un--==_Eq_ElabOpt'(V24, V25)) end end, fun (V26) -> fun (V27) -> ('Idris.Idris2.TTImp.Elab.Check':'dn--un--/=_Eq_ElabOpt'(V26, V27)) end end}, 3, V7))), fun (V29) -> begin (V30 = case V18 of 1 -> {'Idris.Prelude.Types.Right', ('Idris.Idris2.Libraries.Data.IntMap':'un--empty'())}; 0 -> ('Idris.Idris2.Core.UnifyState':'un--saveHoles'(V4, V29)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end), case V30 of {'Idris.Prelude.Types.Left', E0} -> (fun (V31) -> {'Idris.Prelude.Types.Left', V31} end(E0)); {'Idris.Prelude.Types.Right', E1} -> (fun (V32) -> begin (V34 = begin (V33 = ('erlang':'get'(V4))), {'Idris.Prelude.Types.Right', V33} end), case V34 of {'Idris.Prelude.Types.Left', E2} -> (fun (V35) -> {'Idris.Prelude.Types.Left', V35} end(E2)); {'Idris.Prelude.Types.Right', E3} -> (fun (V36) -> begin (V49 = case V36 of {'Idris.Core.UnifyState.MkUState', E4, E5, E6, E7, E8, E9, E10, E11, E12, E13, E14, E15} -> (fun (V37, V38, V39, V40, V41, V42, V43, V44, V45, V46, V47, V48) -> V47 end(E4, E5, E6, E7, E8, E9, E10, E11, E12, E13, E14, E15)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end), begin (V63 = begin (V62 = ('erlang':'put'(V4, case V36 of {'Idris.Core.UnifyState.MkUState', E16, E17, E18, E19, E20, E21, E22, E23, E24, E25, E26, E27} -> (fun (V50, V51, V52, V53, V54, V55, V56, V57, V58, V59, V60, V61) -> {'Idris.Core.UnifyState.MkUState', V50, V51, V52, V53, V54, V55, V56, V57, V58, V59, [], V61} end(E16, E17, E18, E19, E20, E21, E22, E23, E24, E25, E26, E27)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end))), {'Idris.Prelude.Types.Right', V62} end), case V63 of {'Idris.Prelude.Types.Left', E28} -> (fun (V64) -> {'Idris.Prelude.Types.Left', V64} end(E28)); {'Idris.Prelude.Types.Right', E29} -> (fun (V65) -> begin (V66 = ('Idris.Idris2.Core.Context':'un--getNextEntry'(V2, V29))), case V66 of {'Idris.Prelude.Types.Left', E30} -> (fun (V67) -> {'Idris.Prelude.Types.Left', V67} end(E30)); {'Idris.Prelude.Types.Right', E31} -> (fun (V68) -> begin (V70 = begin (V69 = ('erlang':'get'(V2))), {'Idris.Prelude.Types.Right', V69} end), case V70 of {'Idris.Prelude.Types.Left', E32} -> (fun (V71) -> {'Idris.Prelude.Types.Left', V71} end(E32)); {'Idris.Prelude.Types.Right', E33} -> (fun (V72) -> begin (V73 = ('Idris.Idris2.Core.Core':'un--newRef'({'Idris.TTImp.Elab.Check.EST'}, ('Idris.Idris2.TTImp.Elab.Check':'un--initEStateSub'(V0, V5, V10, V11)), V29))), case V73 of {'Idris.Prelude.Types.Left', E34} -> (fun (V74) -> {'Idris.Prelude.Types.Left', V74} end(E34)); {'Idris.Prelude.Types.Right', E35} -> (fun (V75) -> begin (V76 = ('un--getRigNeeded'(V6))), begin (V77 = ('Idris.Idris2.TTImp.Elab.Check':'un--check'(V1, V2, V3, V4, V75, V76, ('Idris.Idris2.TTImp.Elab.Check':'un--initElabInfo'(V6)), V8, V9, V12, V13, V29))), case V77 of {'Idris.Prelude.Types.Left', E36} -> (fun (V78) -> {'Idris.Prelude.Types.Left', V78} end(E36)); {'Idris.Prelude.Types.Right', E37} -> (fun (V79) -> case V79 of {'Idris.Builtin.MkPair', E38, E39} -> (fun (V80, V81) -> begin (V83 = case V6 of {'Idris.TTImp.Elab.Check.InLHS', E40} -> (fun (V82) -> ('Idris.Idris2.Core.Unify':'un--inLHS'()) end(E40)); _ -> ('Idris.Idris2.Core.Unify':'un--inTerm'()) end), begin (V84 = ('Idris.Idris2.Core.Unify':'un--solveConstraints'(V2, V4, V83, 0, V29))), case V84 of {'Idris.Prelude.Types.Left', E41} -> (fun (V85) -> {'Idris.Prelude.Types.Left', V85} end(E41)); {'Idris.Prelude.Types.Right', E42} -> (fun (V86) -> begin (V87 = ('Idris.Idris2.Core.Context.Log':'un--logTerm'(V1, V2, <<"elab"/utf8>>, (1 + (1 + (1 + (1 + (1 + 0))))), fun () -> <<"Looking for delayed in "/utf8>> end, V80, V29))), case V87 of {'Idris.Prelude.Types.Left', E43} -> (fun (V88) -> {'Idris.Prelude.Types.Left', V88} end(E43)); {'Idris.Prelude.Types.Right', E44} -> (fun (V89) -> begin (V91 = begin (V90 = ('erlang':'get'(V4))), {'Idris.Prelude.Types.Right', V90} end), case V91 of {'Idris.Prelude.Types.Left', E45} -> (fun (V92) -> {'Idris.Prelude.Types.Left', V92} end(E45)); {'Idris.Prelude.Types.Right', E46} -> (fun (V93) -> begin (V131 = ('Idris.Idris2.Core.Core':'dn--un--catch_Catchable_Core_Error'(fun (V94) -> ('Idris.Idris2.TTImp.Elab.Delayed':'un--retryDelayed'(V1, V2, V3, V4, V75, V83, ('Idris.Idris2.Data.List':'un--sortBy'(fun (V95) -> fun (V96) -> ('Idris.Idris2.Core.UnifyState':'dn--un--compare_Ord_DelayReason'(('Idris.Idris2.Builtin':'un--fst'(V95)), ('Idris.Idris2.Builtin':'un--fst'(V96)))) end end, case V93 of {'Idris.Core.UnifyState.MkUState', E47, E48, E49, E50, E51, E52, E53, E54, E55, E56, E57, E58} -> (fun (V97, V98, V99, V100, V101, V102, V103, V104, V105, V106, V107, V108) -> V107 end(E47, E48, E49, E50, E51, E52, E53, E54, E55, E56, E57, E58)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end)), V94)) end, fun (V109) -> fun (V110) -> begin (V112 = begin (V111 = ('erlang':'get'(V4))), {'Idris.Prelude.Types.Right', V111} end), case V112 of {'Idris.Prelude.Types.Left', E59} -> (fun (V113) -> {'Idris.Prelude.Types.Left', V113} end(E59)); {'Idris.Prelude.Types.Right', E60} -> (fun (V114) -> begin (V128 = begin (V127 = ('erlang':'put'(V4, case V114 of {'Idris.Core.UnifyState.MkUState', E61, E62, E63, E64, E65, E66, E67, E68, E69, E70, E71, E72} -> (fun (V115, V116, V117, V118, V119, V120, V121, V122, V123, V124, V125, V126) -> {'Idris.Core.UnifyState.MkUState', V115, V116, V117, V118, V119, V120, V121, V122, V123, V124, V49, V126} end(E61, E62, E63, E64, E65, E66, E67, E68, E69, E70, E71, E72)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end))), {'Idris.Prelude.Types.Right', V127} end), case V128 of {'Idris.Prelude.Types.Left', E73} -> (fun (V129) -> {'Idris.Prelude.Types.Left', V129} end(E73)); {'Idris.Prelude.Types.Right', E74} -> (fun (V130) -> ('Idris.Idris2.Core.Core':'dn--un--throw_Catchable_Core_Error'(V109, V110)) end(E74)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E60)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end end, V29))), case V131 of {'Idris.Prelude.Types.Left', E75} -> (fun (V132) -> {'Idris.Prelude.Types.Left', V132} end(E75)); {'Idris.Prelude.Types.Right', E76} -> (fun (V133) -> begin (V135 = begin (V134 = ('erlang':'get'(V4))), {'Idris.Prelude.Types.Right', V134} end), case V135 of {'Idris.Prelude.Types.Left', E77} -> (fun (V136) -> {'Idris.Prelude.Types.Left', V136} end(E77)); {'Idris.Prelude.Types.Right', E78} -> (fun (V137) -> begin (V151 = begin (V150 = ('erlang':'put'(V4, case V137 of {'Idris.Core.UnifyState.MkUState', E79, E80, E81, E82, E83, E84, E85, E86, E87, E88, E89, E90} -> (fun (V138, V139, V140, V141, V142, V143, V144, V145, V146, V147, V148, V149) -> {'Idris.Core.UnifyState.MkUState', V138, V139, V140, V141, V142, V143, V144, V145, V146, V147, V49, V149} end(E79, E80, E81, E82, E83, E84, E85, E86, E87, E88, E89, E90)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end))), {'Idris.Prelude.Types.Right', V150} end), case V151 of {'Idris.Prelude.Types.Left', E91} -> (fun (V152) -> {'Idris.Prelude.Types.Left', V152} end(E91)); {'Idris.Prelude.Types.Right', E92} -> (fun (V153) -> begin (V154 = ('Idris.Idris2.Core.Unify':'un--solveConstraintsAfter'(V2, V4, V68, V83, 2, V29))), case V154 of {'Idris.Prelude.Types.Left', E93} -> (fun (V155) -> {'Idris.Prelude.Types.Left', V155} end(E93)); {'Idris.Prelude.Types.Right', E94} -> (fun (V156) -> begin (V163 = case case V18 of 1 -> ('Idris.Idris2.Data.Maybe':'un--isJust'(('Idris.Idris2.TTImp.Elab.Check':'un--isLHS'(V6)))); 0 -> 1; _ -> ('erlang':'throw'("Error: Unreachable branch")) end of 1 -> begin (V157 = ('Idris.Idris2.Core.Context.Log':'un--log'(V2, <<"elab"/utf8>>, (1 + (1 + (1 + (1 + (1 + 0))))), fun () -> <<"Resolving default hints"/utf8>> end, V29))), case V157 of {'Idris.Prelude.Types.Left', E95} -> (fun (V158) -> {'Idris.Prelude.Types.Left', V158} end(E95)); {'Idris.Prelude.Types.Right', E96} -> (fun (V159) -> begin (V160 = ('Idris.Idris2.Core.Unify':'un--solveConstraintsAfter'(V2, V4, V68, V83, 1, V29))), case V160 of {'Idris.Prelude.Types.Left', E97} -> (fun (V161) -> {'Idris.Prelude.Types.Left', V161} end(E97)); {'Idris.Prelude.Types.Right', E98} -> (fun (V162) -> ('Idris.Idris2.Core.Unify':'un--solveConstraintsAfter'(V2, V4, V68, V83, 3, V29)) end(E98)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E96)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end; 0 -> {'Idris.Prelude.Types.Right', 0}; _ -> ('erlang':'throw'("Error: Unreachable branch")) end), case V163 of {'Idris.Prelude.Types.Left', E99} -> (fun (V164) -> {'Idris.Prelude.Types.Left', V164} end(E99)); {'Idris.Prelude.Types.Right', E100} -> (fun (V165) -> begin (V166 = ('Idris.Idris2.Core.UnifyState':'un--dumpConstraints'(V4, V2, <<"elab"/utf8>>, (1 + (1 + (1 + (1 + 0)))), 0, V29))), case V166 of {'Idris.Prelude.Types.Left', E101} -> (fun (V167) -> {'Idris.Prelude.Types.Left', V167} end(E101)); {'Idris.Prelude.Types.Right', E102} -> (fun (V168) -> begin (V170 = begin (V169 = ('erlang':'get'(V2))), {'Idris.Prelude.Types.Right', V169} end), case V170 of {'Idris.Prelude.Types.Left', E103} -> (fun (V171) -> {'Idris.Prelude.Types.Left', V171} end(E103)); {'Idris.Prelude.Types.Right', E104} -> (fun (V172) -> begin (V173 = case V23 of 1 -> ('Idris.Idris2.Core.Normalise':'un--normaliseHoles'(V2, V1, V172, V9, V80, V29)); 0 -> ('Idris.Idris2.Core.Normalise':'un--normaliseArgHoles'(V2, V1, V172, V9, V80, V29)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end), case V173 of {'Idris.Prelude.Types.Left', E105} -> (fun (V174) -> {'Idris.Prelude.Types.Left', V174} end(E105)); {'Idris.Prelude.Types.Right', E106} -> (fun (V175) -> begin (V186 = case V6 of {'Idris.TTImp.Elab.Check.InLHS', E109} -> (fun (V176) -> begin (V177 = case V18 of 1 -> {'Idris.Prelude.Types.Right', 0}; 0 -> ('Idris.Idris2.Core.UnifyState':'un--checkUserHolesAfter'(V4, V2, V68, 1, V29)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end), case V177 of {'Idris.Prelude.Types.Left', E110} -> (fun (V178) -> {'Idris.Prelude.Types.Left', V178} end(E110)); {'Idris.Prelude.Types.Right', E111} -> (fun (V179) -> {'Idris.Prelude.Types.Right', V175} end(E111)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E109)); {'Idris.TTImp.Elab.Check.InTransform'} -> (fun () -> begin (V180 = case V18 of 1 -> {'Idris.Prelude.Types.Right', 0}; 0 -> ('Idris.Idris2.Core.UnifyState':'un--checkUserHolesAfter'(V4, V2, V68, 1, V29)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end), case V180 of {'Idris.Prelude.Types.Left', E112} -> (fun (V181) -> {'Idris.Prelude.Types.Left', V181} end(E112)); {'Idris.Prelude.Types.Right', E113} -> (fun (V182) -> {'Idris.Prelude.Types.Right', V175} end(E113)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end()); _ -> case V18 of 1 -> {'Idris.Prelude.Types.Right', V175}; 0 -> begin (V183 = ('Idris.Idris2.Core.UnifyState':'un--checkUserHolesAfter'(V4, V2, V68, case V28 of 1 -> 1; 0 -> V23; _ -> ('erlang':'throw'("Error: Unreachable branch")) end, V29))), case V183 of {'Idris.Prelude.Types.Left', E107} -> (fun (V184) -> {'Idris.Prelude.Types.Left', V184} end(E107)); {'Idris.Prelude.Types.Right', E108} -> (fun (V185) -> ('Idris.Idris2.Core.LinearCheck':'un--linearCheck'(V1, V2, V4, ('Idris.Idris2.TTImp.TTImp':'un--getFC'(V12)), V76, 0, V9, V175, V29)) end(E108)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end; _ -> ('erlang':'throw'("Error: Unreachable branch")) end end), case V186 of {'Idris.Prelude.Types.Left', E114} -> (fun (V187) -> {'Idris.Prelude.Types.Left', V187} end(E114)); {'Idris.Prelude.Types.Right', E115} -> (fun (V188) -> begin (V189 = ('un--normaliseHoleTypes'(V2, V4, V29))), case V189 of {'Idris.Prelude.Types.Left', E116} -> (fun (V190) -> {'Idris.Prelude.Types.Left', V190} end(E116)); {'Idris.Prelude.Types.Right', E117} -> (fun (V191) -> begin (V195 = case V18 of 1 -> {'Idris.Prelude.Types.Right', 0}; 0 -> begin (V192 = ('Idris.Idris2.Core.UnifyState':'un--getHoles'(V4, V29))), case V192 of {'Idris.Prelude.Types.Left', E118} -> (fun (V193) -> {'Idris.Prelude.Types.Left', V193} end(E118)); {'Idris.Prelude.Types.Right', E119} -> (fun (V194) -> ('Idris.Idris2.Core.UnifyState':'un--restoreHoles'(V4, ('nested--9601-9703--in--un--addHoles'(V0, V1, V13, V12, V11, V10, V9, V8, V7, V6, V5, V4, V3, V2, ('Idris.Idris2.Libraries.Data.IntMap':'un--empty'()), V194, ('Idris.Idris2.Libraries.Data.IntMap':'un--toList'(V32)))), V29)) end(E119)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end; _ -> ('erlang':'throw'("Error: Unreachable branch")) end), case V195 of {'Idris.Prelude.Types.Left', E120} -> (fun (V196) -> {'Idris.Prelude.Types.Left', V196} end(E120)); {'Idris.Prelude.Types.Right', E121} -> (fun (V197) -> begin (V199 = begin (V198 = ('erlang':'get'(V75))), {'Idris.Prelude.Types.Right', V198} end), case V199 of {'Idris.Prelude.Types.Left', E122} -> (fun (V200) -> {'Idris.Prelude.Types.Left', V200} end(E122)); {'Idris.Prelude.Types.Right', E123} -> (fun (V201) -> begin (V218 = ('Idris.Idris2.Core.Core':'un--traverse_'(fun (V202) -> fun (V203) -> ('un--addHoleToSave'(V2, V202, V203)) end end, ('Idris.Idris2.Libraries.Data.NameMap':'un--keys'(case V201 of {'Idris.TTImp.Elab.Check.MkEState', E124, E125, E126, E127, E128, E129, E130, E131, E132, E133, E134, E135, E136, E137} -> (fun (V204, V205, V206, V207, V208, V209, V210, V211, V212, V213, V214, V215, V216, V217) -> V216 end(E124, E125, E126, E127, E128, E129, E130, E131, E132, E133, E134, E135, E136, E137)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end)), V29))), case V218 of {'Idris.Prelude.Types.Left', E138} -> (fun (V219) -> {'Idris.Prelude.Types.Left', V219} end(E138)); {'Idris.Prelude.Types.Right', E139} -> (fun (V220) -> case V6 of {'Idris.TTImp.Elab.Check.InLHS', E142} -> (fun (V221) -> begin (V222 = ('un--findPLetRenames'(V1, V188))), begin (V223 = ('un--doPLetRenames'(V1, V222, [], V188))), begin (V224 = (('Idris.Idris2.Core.Normalise.Eval':'un--getTerm'(V81))(V29))), case V224 of {'Idris.Prelude.Types.Left', E143} -> (fun (V225) -> {'Idris.Prelude.Types.Left', V225} end(E143)); {'Idris.Prelude.Types.Right', E144} -> (fun (V226) -> {'Idris.Prelude.Types.Right', {'Idris.Builtin.MkPair', V223, ('Idris.Idris2.Core.Normalise.Eval':'un--gnf'(V1, V9, ('un--doPLetRenames'(V1, V222, [], V226))))}} end(E144)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end end end(E142)); _ -> begin (V227 = ('Idris.Idris2.Core.UnifyState':'un--dumpConstraints'(V4, V2, <<"elab"/utf8>>, (1 + (1 + 0)), 0, V29))), case V227 of {'Idris.Prelude.Types.Left', E140} -> (fun (V228) -> {'Idris.Prelude.Types.Left', V228} end(E140)); {'Idris.Prelude.Types.Right', E141} -> (fun (V229) -> {'Idris.Prelude.Types.Right', {'Idris.Builtin.MkPair', V188, V81}} end(E141)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end end(E139)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E123)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E121)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E117)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E115)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E106)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E104)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E102)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E100)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E94)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E92)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E78)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E76)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E46)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E44)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E42)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end end(E38, E39)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E37)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end end(E35)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E33)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E31)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E29)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end end(E3)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end end end end.
'un--elabTerm'(V0, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10) -> ('un--elabTermSub'(V0, V0, V1, V2, V3, V4, V5, V6, V7, V8, V8, {'Idris.Core.TT.SubRefl'}, V9, V10)).
'un--doPLetRenames'(V0, V1, V2, V3) -> case V3 of {'Idris.Core.TT.Bind', E0, E1, E2, E3} -> (fun (V4, V5, V6, V7) -> case V6 of {'Idris.Core.TT.PLet', E4, E5, E6, E7} -> (fun (V8, V9, V10, V11) -> begin (V12 = {'Idris.Core.TT.PLet', V8, V9, V10, V11}), case ('Idris.Idris2.Prelude.Types':'un--elem'({'Idris.Prelude.EqOrd.MkEq', fun (V13) -> fun (V14) -> ('Idris.Idris2.Core.Name':'dn--un--==_Eq_Name'(V13, V14)) end end, fun (V15) -> fun (V16) -> ('Idris.Idris2.Core.Name':'dn--un--/=_Eq_Name'(V15, V16)) end end}, V5, V2)) of 1 -> ('Idris.Idris2.Core.TT.SubstEnv':'un--subst'({'Idris.Core.TT.Erased', V4, 0}, ('un--doPLetRenames'([V5 | V0], V1, V2, V7)))); 0 -> {'Idris.Core.TT.Bind', V4, V5, V12, ('un--doPLetRenames'([V5 | V0], V1, V2, V7))}; _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E4, E5, E6, E7)); _ -> ('case--doPLetRenames-9409'(V0, V5, V7, V6, V4, V2, V1, ('Idris.Idris2.Data.List':'un--lookup'({'Idris.Prelude.EqOrd.MkEq', fun (V17) -> fun (V18) -> ('Idris.Idris2.Core.Name':'dn--un--==_Eq_Name'(V17, V18)) end end, fun (V19) -> fun (V20) -> ('Idris.Idris2.Core.Name':'dn--un--/=_Eq_Name'(V19, V20)) end end}, V5, V1)))) end end(E0, E1, E2, E3)); _ -> V3 end.
'un--checkTermSub'(V0, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14) -> begin (V16 = case V6 of {'Idris.TTImp.Elab.Check.InType'} -> (fun () -> ('Idris.Idris2.Core.Context':'un--branch'(V2, V14)) end()); _ -> begin (V15 = ('erlang':'get'(V2))), {'Idris.Prelude.Types.Right', V15} end end), case V16 of {'Idris.Prelude.Types.Left', E0} -> (fun (V17) -> {'Idris.Prelude.Types.Left', V17} end(E0)); {'Idris.Prelude.Types.Right', E1} -> (fun (V18) -> begin (V20 = begin (V19 = ('erlang':'get'(V4))), {'Idris.Prelude.Types.Right', V19} end), case V20 of {'Idris.Prelude.Types.Left', E2} -> (fun (V21) -> {'Idris.Prelude.Types.Left', V21} end(E2)); {'Idris.Prelude.Types.Right', E3} -> (fun (V22) -> begin (V24 = begin (V23 = ('erlang':'get'(V3))), {'Idris.Prelude.Types.Right', V23} end), case V24 of {'Idris.Prelude.Types.Left', E4} -> (fun (V25) -> {'Idris.Prelude.Types.Left', V25} end(E4)); {'Idris.Prelude.Types.Right', E5} -> (fun (V26) -> begin (V48 = ('Idris.Idris2.Core.Core':'dn--un--catch_Catchable_Core_Error'(('un--elabTermSub'(V0, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, {'Idris.Prelude.Types.Just', V13})), fun (V27) -> fun (V28) -> case V27 of {'Idris.Core.Core.TryWithImplicits', E6, E7, E8, E9} -> (fun (V29, V30, V31, V32) -> begin (V34 = begin (V33 = ('erlang':'put'(V2, V18))), {'Idris.Prelude.Types.Right', V33} end), case V34 of {'Idris.Prelude.Types.Left', E10} -> (fun (V35) -> {'Idris.Prelude.Types.Left', V35} end(E10)); {'Idris.Prelude.Types.Right', E11} -> (fun (V36) -> begin (V38 = begin (V37 = ('erlang':'put'(V4, V22))), {'Idris.Prelude.Types.Right', V37} end), case V38 of {'Idris.Prelude.Types.Left', E12} -> (fun (V39) -> {'Idris.Prelude.Types.Left', V39} end(E12)); {'Idris.Prelude.Types.Right', E13} -> (fun (V40) -> begin (V42 = begin (V41 = ('erlang':'put'(V3, V26))), {'Idris.Prelude.Types.Right', V41} end), case V42 of {'Idris.Prelude.Types.Left', E14} -> (fun (V43) -> {'Idris.Prelude.Types.Left', V43} end(E14)); {'Idris.Prelude.Types.Right', E15} -> (fun (V44) -> begin (V45 = (('nested--11422-11229--in--un--bindImps'(V0, V1, V13, V12, V11, V10, V9, V8, V7, V6, V5, V4, V3, V2, V29, V30, V31, V32, V12))(V28))), case V45 of {'Idris.Prelude.Types.Left', E16} -> (fun (V46) -> {'Idris.Prelude.Types.Left', V46} end(E16)); {'Idris.Prelude.Types.Right', E17} -> (fun (V47) -> (('un--elabTermSub'(V0, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V47, {'Idris.Prelude.Types.Just', V13}))(V28)) end(E17)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E15)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E13)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E11)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E6, E7, E8, E9)); _ -> ('Idris.Idris2.Core.Core':'dn--un--throw_Catchable_Core_Error'(V27, V28)) end end end, V14))), case V48 of {'Idris.Prelude.Types.Left', E18} -> (fun (V49) -> {'Idris.Prelude.Types.Left', V49} end(E18)); {'Idris.Prelude.Types.Right', E19} -> (fun (V50) -> begin (V51 = case V6 of {'Idris.TTImp.Elab.Check.InType'} -> (fun () -> ('Idris.Idris2.Core.Context':'un--commit'(V2, V14)) end()); _ -> {'Idris.Prelude.Types.Right', 0} end), case V51 of {'Idris.Prelude.Types.Left', E20} -> (fun (V52) -> {'Idris.Prelude.Types.Left', V52} end(E20)); {'Idris.Prelude.Types.Right', E21} -> (fun (V53) -> {'Idris.Prelude.Types.Right', ('Idris.Idris2.Builtin':'un--fst'(V50))} end(E21)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E19)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E5)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E3)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end.
'un--checkTerm'(V0, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11) -> ('un--checkTermSub'(V0, V0, V1, V2, V3, V4, V5, V6, V7, V8, V8, {'Idris.Core.TT.SubRefl'}, V9, V10, V11)).
'un--addHoleToSave'(V0, V1, V2) -> begin (V4 = begin (V3 = ('erlang':'get'(V0))), {'Idris.Prelude.Types.Right', V3} end), case V4 of {'Idris.Prelude.Types.Left', E0} -> (fun (V5) -> {'Idris.Prelude.Types.Left', V5} end(E0)); {'Idris.Prelude.Types.Right', E1} -> (fun (V6) -> begin (V37 = ('Idris.Idris2.Core.Context':'un--lookupTyExact'(V1, case V6 of {'Idris.Core.Context.MkDefs', E2, E3, E4, E5, E6, E7, E8, E9, E10, E11, E12, E13, E14, E15, E16, E17, E18, E19, E20, E21, E22, E23, E24, E25, E26, E27, E28, E29, E30, E31} -> (fun (V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36) -> V7 end(E2, E3, E4, E5, E6, E7, E8, E9, E10, E11, E12, E13, E14, E15, E16, E17, E18, E19, E20, E21, E22, E23, E24, E25, E26, E27, E28, E29, E30, E31)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end, V2))), case V37 of {'Idris.Prelude.Types.Left', E32} -> (fun (V38) -> {'Idris.Prelude.Types.Left', V38} end(E32)); {'Idris.Prelude.Types.Right', E33} -> (fun (V39) -> case V39 of {'Idris.Prelude.Types.Just', E34} -> (fun (V40) -> begin (V41 = ('Idris.Idris2.Libraries.Data.NameMap':'un--keys'(('Idris.Idris2.Core.TT':'un--getMetas'(V40))))), begin (V42 = ('Idris.Idris2.Core.Context':'un--addToSave'(V0, V1, V2))), case V42 of {'Idris.Prelude.Types.Left', E35} -> (fun (V43) -> {'Idris.Prelude.Types.Left', V43} end(E35)); {'Idris.Prelude.Types.Right', E36} -> (fun (V44) -> ('Idris.Idris2.Core.Core':'un--traverse_'(fun (V45) -> fun (V46) -> ('Idris.Idris2.Core.Context':'un--addToSave'(V0, V45, V46)) end end, V41, V2)) end(E36)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end end(E34)); {'Idris.Prelude.Types.Nothing'} -> (fun () -> {'Idris.Prelude.Types.Right', 0} end()); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E33)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end.
