-module('Idris.Idris2.Compiler.Erlang.Erlang').
-compile('no_auto_import').
-compile('inline').
-compile({'inline_size',24}).
-export([
  'nested--9710-4127--in--un--shouldCompileName'/6,
  'un--writeErlangModule'/7,
  'un--splitNamespaceInfo'/2,
  'un--groupBy'/4,
  'un--getExportFunNames'/1,
  'un--getCompileExpr'/3,
  'un--genExports'/5,
  'un--genDeclErl'/1,
  'un--genDeclAbstr'/1,
  'un--genCompdef'/3,
  'un--findErlangExecutable'/1,
  'un--findErlangCompiler'/1,
  'un--executeExpr'/3,
  'un--defsPerModule'/1,
  'un--defLine'/0,
  'un--concatNamespaceInfo'/2,
  'un--compileMainEntrypointToModules'/5,
  'un--compileLibraryToModules'/4,
  'un--compileLibrary'/6,
  'un--compileExpr'/6,
  'un--codegenErlang'/0,
  'un--build'/7
]).
'nested--9710-4127--in--un--shouldCompileName'(V0, V1, V2, V3, V4, V5) -> case V4 of {'Idris.Prelude.Types.Nothing'} -> (fun () -> 1 end()); {'Idris.Prelude.Types.Just', E0} -> (fun (V6) -> begin (V8 = ('Idris.Idris2.Prelude.Types':'dn--un--map_Functor_List'(fun (V7) -> ('Idris.Idris2.Core.Name.Namespace':'un--miAsNamespace'(V7)) end, V6))), ('Idris.Idris2.Prelude.Interfaces':'un--any'({'Idris.Prelude.Interfaces.MkFoldable', fun (V9) -> fun (V10) -> fun (V11) -> fun (V12) -> fun (V13) -> ('Idris.Idris2.Prelude.Types':'dn--un--foldr_Foldable_List'(V11, V12, V13)) end end end end end, fun (V14) -> fun (V15) -> fun (V16) -> fun (V17) -> fun (V18) -> ('Idris.Idris2.Prelude.Types':'dn--un--foldl_Foldable_List'(V16, V17, V18)) end end end end end, fun (V19) -> fun (V20) -> ('Idris.Idris2.Prelude.Types':'dn--un--null_Foldable_List'(V20)) end end, fun (V21) -> fun (V22) -> fun (V23) -> fun (V24) -> fun (V25) -> fun (V26) -> fun (V27) -> ('Idris.Idris2.Prelude.Types':'dn--un--foldlM_Foldable_List'(V24, V25, V26, V27)) end end end end end end end, fun (V28) -> fun (V29) -> ('Idris.Idris2.Prelude.Types':'dn--un--toList_Foldable_List'(V29)) end end, fun (V30) -> fun (V31) -> fun (V32) -> fun (V33) -> fun (V34) -> ('Idris.Idris2.Prelude.Types':'dn--un--foldMap_Foldable_List'(V32, V33, V34)) end end end end end}, fun (V35) -> ('Idris.Idris2.Core.Name.Namespace':'un--isParentOf'(V35, ('Idris.Idris2.Compiler.Erlang.Name':'un--getNamespace'(V5)))) end, V8)) end end(E0)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--writeErlangModule'(V0, V1, V2, V3, V4, V5, V6) -> case V6 of {'Idris.Builtin.MkPair', E0, E1} -> (fun (V7, V8) -> begin (V16 = case V7 of {'Idris.Compiler.Erlang.Name.Concat', E2} -> (fun (V9) -> {'Idris.Prelude.Types.Nothing'} end(E2)); {'Idris.Compiler.Erlang.Name.Split', E3, E4} -> (fun (V10, V11) -> ('Idris.Idris2.Data.List':'un--find'(fun (V12) -> ('Idris.Idris2.Core.Name.Namespace':'dn--un--==_Eq_Namespace'(case V12 of {'Idris.Compiler.Erlang.ModuleOpts.MkModuleOpts', E5, E6, E7} -> (fun (V13, V14, V15) -> V13 end(E5, E6, E7)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end, V11)) end, V2)) end(E3, E4)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end), fun (V17) -> begin (V25 = (('Idris.Idris2.Prelude.Types':'un--maybe'(fun () -> fun (V18) -> {'Idris.Prelude.Types.Right', []} end end, fun () -> fun (V19) -> fun (V20) -> ('un--genExports'(V0, V7, ('un--defLine'()), V19, V20)) end end end, ('Idris.Idris2.Prelude.Types':'dn--un-->>=_Monad_Maybe'(V16, fun (V21) -> case V21 of {'Idris.Compiler.Erlang.ModuleOpts.MkModuleOpts', E8, E9, E10} -> (fun (V22, V23, V24) -> V23 end(E8, E9, E10)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end))))(V17))), case V25 of {'Idris.Prelude.Types.Left', E11} -> (fun (V26) -> {'Idris.Prelude.Types.Left', V26} end(E11)); {'Idris.Prelude.Types.Right', E12} -> (fun (V27) -> begin (V28 = ('Idris.Idris2.Compiler.Erlang.Name':'un--currentModuleName'(V7))), begin (V33 = ('Idris.Idris2.Prelude.Types':'dn--un-->>=_Monad_Maybe'(V16, fun (V29) -> case V29 of {'Idris.Compiler.Erlang.ModuleOpts.MkModuleOpts', E13, E14, E15} -> (fun (V30, V31, V32) -> V32 end(E13, E14, E15)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end))), begin (V42 = case ('Idris.Idris2.Prelude.Types':'dn--un-->_Ord_Nat'(('Idris.Idris2.Data.Maybe':'un--fromMaybe'(fun () -> case V1 of {'Idris.Compiler.Erlang.GlobalOpts.MkGlobalOpts', E20, E21, E22, E23} -> (fun (V34, V35, V36, V37) -> V36 end(E20, E21, E22, E23)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end, V33)), 0)) of 1 -> [{'Idris.Compiler.Erlang.IR.ErlExpr.Inline', ('un--defLine'())} | [{'Idris.Compiler.Erlang.IR.ErlExpr.InlineSize', ('un--defLine'()), case V1 of {'Idris.Compiler.Erlang.GlobalOpts.MkGlobalOpts', E16, E17, E18, E19} -> (fun (V38, V39, V40, V41) -> V40 end(E16, E17, E18, E19)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end} | []]]; 0 -> []; _ -> ('erlang':'throw'("Error: Unreachable branch")) end), begin (V43 = {'Idris.Compiler.Erlang.IR.ErlExpr.MkModule', {'Idris.Compiler.Erlang.IR.ErlExpr.MkModuleName', ('un--defLine'()), V28}, [{'Idris.Compiler.Erlang.IR.ErlExpr.NoAutoImport', ('un--defLine'())} | V42], ('Idris.Idris2.Prelude.Types.List':'un--tailRecAppend'(V27, V8))}), begin (V44 = ('Idris.Idris2.Libraries.Utils.Path':'un--</>'(V3, ('Idris.Idris2.Prelude.Types.String':'un--++'(V28, ('Idris.Idris2.Prelude.Types.String':'un--++'(<<"."/utf8>>, V4))))))), begin (V45 = ('Idris.Idris2.Compiler.Erlang.Codegen.ErlExprToAbstractFormat':'un--genErlModule'(('un--defLine'()), V43))), begin (V46 = ('Idris.Idris2.Data.String':'un--fastAppend'(('Idris.Idris2.Compiler.Erlang.Utils.CompositeString':'un--flatten'({'Idris.Compiler.Erlang.Utils.CompositeString.Nested', ('Idris.Idris2.Prelude.Types':'dn--un--map_Functor_List'(V5, V45))}))))), begin (V75 = begin (V74 = (('Idris.Idris2.Erlang.System.File':'un--writeFile'({'Idris.Prelude.IO.MkHasIO', {'Idris.Prelude.Interfaces.MkMonad', {'Idris.Prelude.Interfaces.MkApplicative', fun (V47) -> fun (V48) -> fun (V49) -> fun (V50) -> fun (V51) -> ('Idris.Idris2.Prelude.IO':'dn--un--map_Functor_IO'(V49, V50, V51)) end end end end end, fun (V52) -> fun (V53) -> fun (V54) -> V53 end end end, fun (V55) -> fun (V56) -> fun (V57) -> fun (V58) -> fun (V59) -> begin (V60 = (V57(V59))), begin (V61 = (V58(V59))), (V60(V61)) end end end end end end end}, fun (V62) -> fun (V63) -> fun (V64) -> fun (V65) -> fun (V66) -> begin (V67 = (V64(V66))), ((V65(V67))(V66)) end end end end end end, fun (V68) -> fun (V69) -> fun (V70) -> begin (V71 = (V69(V70))), (V71(V70)) end end end end}, fun (V72) -> fun (V73) -> V73 end end}, V44, V46))(V17))), {'Idris.Prelude.Types.Right', V74} end), case V75 of {'Idris.Prelude.Types.Left', E24} -> (fun (V76) -> {'Idris.Prelude.Types.Left', V76} end(E24)); {'Idris.Prelude.Types.Right', E25} -> (fun (V77) -> case V77 of {'Idris.Prelude.Types.Right', E26} -> (fun (V78) -> case V78 of 0 -> {'Idris.Prelude.Types.Right', V44}; _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E26)); {'Idris.Prelude.Types.Left', E27} -> (fun (V79) -> ('Idris.Idris2.Core.Core':'dn--un--throw_Catchable_Core_Error'({'Idris.Core.Core.FileErr', V44, V79}, V17)) end(E27)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E25)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end end end end end end end end(E12)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end end end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--splitNamespaceInfo'(V0, V1) -> case V1 of {'Idris.Builtin.MkPair', E0, E1} -> (fun (V2, V3) -> begin (V4 = ('Idris.Idris2.Compiler.Erlang.Name':'un--getNamespace'(V2))), {'Idris.Builtin.MkPair', {'Idris.Compiler.Erlang.Name.Split', V0, V4}, V1} end end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--groupBy'(V0, V1, V2, V3) -> case V3 of [] -> ('Idris.Idris2.Libraries.Data.SortedMap':'un--empty'(V0)); [E0 | E1] -> (fun (V4, V5) -> ('Idris.Idris2.Libraries.Data.SortedMap':'dn--un--<+>_Semigroup_((SortedMap $k) $v)'(fun (V6) -> fun (V7) -> ('Idris.Idris2.Prelude.Types':'dn--un--<+>_Semigroup_(List $a)'(V6, V7)) end end, ('Idris.Idris2.Libraries.Data.SortedMap':'un--singleton'(V0, (V1(V4)), [(V2(V4)) | []])), ('un--groupBy'(V0, V1, V2, V5)))) end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--getExportFunNames'(V0) -> ('Idris.Idris2.Data.List':'un--mapMaybe'(fun (V1) -> ('Idris.Idris2.Prelude.Interfaces':'un--<$>'(fun (V2) -> fun (V3) -> fun (V4) -> fun (V5) -> ('Idris.Idris2.Prelude.Types':'dn--un--map_Functor_Maybe'(V4, V5)) end end end end, fun (V6) -> {'Idris.Builtin.MkPair', case V1 of {'Idris.Compiler.Erlang.ModuleOpts.MkModuleOpts', E0, E1, E2} -> (fun (V7, V8, V9) -> V7 end(E0, E1, E2)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end, V6} end, case V1 of {'Idris.Compiler.Erlang.ModuleOpts.MkModuleOpts', E3, E4, E5} -> (fun (V10, V11, V12) -> V11 end(E3, E4, E5)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end)) end, V0)).
'un--getCompileExpr'(V0, V1, V2) -> begin (V4 = begin (V3 = ('erlang':'get'(V0))), {'Idris.Prelude.Types.Right', V3} end), case V4 of {'Idris.Prelude.Types.Left', E0} -> (fun (V5) -> {'Idris.Prelude.Types.Left', V5} end(E0)); {'Idris.Prelude.Types.Right', E1} -> (fun (V6) -> begin (V37 = (('Idris.Idris2.Core.Context':'un--lookupCtxtExact'(V1, case V6 of {'Idris.Core.Context.MkDefs', E2, E3, E4, E5, E6, E7, E8, E9, E10, E11, E12, E13, E14, E15, E16, E17, E18, E19, E20, E21, E22, E23, E24, E25, E26, E27, E28, E29, E30, E31} -> (fun (V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36) -> V7 end(E2, E3, E4, E5, E6, E7, E8, E9, E10, E11, E12, E13, E14, E15, E16, E17, E18, E19, E20, E21, E22, E23, E24, E25, E26, E27, E28, E29, E30, E31)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end))(V2))), case V37 of {'Idris.Prelude.Types.Left', E32} -> (fun (V38) -> {'Idris.Prelude.Types.Left', V38} end(E32)); {'Idris.Prelude.Types.Right', E33} -> (fun (V39) -> case V39 of {'Idris.Prelude.Types.Just', E34} -> (fun (V40) -> case ('Idris.Idris2.Prelude.Interfaces':'un--<$>'(fun (V41) -> fun (V42) -> fun (V43) -> fun (V44) -> ('Idris.Idris2.Prelude.Types':'dn--un--map_Functor_Maybe'(V43, V44)) end end end end, fun (V45) -> ('Idris.Idris2.Core.CompileExpr':'un--forgetDef'(V45)) end, case V40 of {'Idris.Core.Context.Context.MkGlobalDef', E36, E37, E38, E39, E40, E41, E42, E43, E44, E45, E46, E47, E48, E49, E50, E51, E52, E53, E54, E55} -> (fun (V46, V47, V48, V49, V50, V51, V52, V53, V54, V55, V56, V57, V58, V59, V60, V61, V62, V63, V64, V65) -> V64 end(E36, E37, E38, E39, E40, E41, E42, E43, E44, E45, E46, E47, E48, E49, E50, E51, E52, E53, E54, E55)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end)) of {'Idris.Prelude.Types.Just', E35} -> (fun (V66) -> {'Idris.Prelude.Types.Right', V66} end(E35)); {'Idris.Prelude.Types.Nothing'} -> (fun () -> ('Idris.Idris2.Core.Core':'dn--un--throw_Catchable_Core_Error'({'Idris.Core.Core.InternalError', ('Idris.Idris2.Prelude.Types.String':'un--++'(<<"No compiled definition for "/utf8>>, ('Idris.Idris2.Core.Name':'dn--un--show_Show_Name'(V1))))}, V2)) end()); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E34)); {'Idris.Prelude.Types.Nothing'} -> (fun () -> ('Idris.Idris2.Core.Core':'dn--un--throw_Catchable_Core_Error'({'Idris.Core.Core.InternalError', ('Idris.Idris2.Prelude.Types.String':'un--++'(<<"Compiling undefined name "/utf8>>, ('Idris.Idris2.Core.Name':'dn--un--show_Show_Name'(V1))))}, V2)) end()); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E33)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end.
'un--genExports'(V0, V1, V2, V3, V4) -> begin (V5 = ('un--getCompileExpr'(V0, V3, V4))), case V5 of {'Idris.Prelude.Types.Left', E0} -> (fun (V6) -> {'Idris.Prelude.Types.Left', V6} end(E0)); {'Idris.Prelude.Types.Right', E1} -> (fun (V7) -> case V7 of {'Idris.Core.CompileExpr.MkNmFun', E2, E3} -> (fun (V8, V9) -> case V8 of [] -> (('Idris.Idris2.Compiler.Erlang.Codegen.NamedCExpToErlExpr':'un--readExports'(V1, V2, V9))(V4)); _ -> ('Idris.Idris2.Core.Core':'dn--un--throw_Catchable_Core_Error'({'Idris.Core.Core.InternalError', ('Idris.Idris2.Prelude.Types.String':'un--++'(<<"Expected function definition for "/utf8>>, ('Idris.Idris2.Core.Name':'dn--un--show_Show_Name'(V3))))}, V4)) end end(E2, E3)); _ -> ('Idris.Idris2.Core.Core':'dn--un--throw_Catchable_Core_Error'({'Idris.Core.Core.InternalError', ('Idris.Idris2.Prelude.Types.String':'un--++'(<<"Expected function definition for "/utf8>>, ('Idris.Idris2.Core.Name':'dn--un--show_Show_Name'(V3))))}, V4)) end end(E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end.
'un--genDeclErl'(V0) -> {'Idris.Compiler.Erlang.Utils.CompositeString.Nested', [('Idris.Idris2.Compiler.Erlang.Codegen.AbstractFormatToErlangSource':'un--genDecl'(V0)) | [{'Idris.Compiler.Erlang.Utils.CompositeString.Str', <<"\x{a}"/utf8>>} | []]]}.
'un--genDeclAbstr'(V0) -> {'Idris.Compiler.Erlang.Utils.CompositeString.Nested', [('Idris.Idris2.Compiler.Erlang.Utils.PrimTerm':'un--primTermToCS'(('Idris.Idris2.Compiler.Erlang.Codegen.AbstractFormatToPrimTerm':'un--genDecl'(V0)))) | [{'Idris.Compiler.Erlang.Utils.CompositeString.Str', <<".\x{a}"/utf8>>} | []]]}.
'un--genCompdef'(V0, V1, V2) -> case V2 of {'Idris.Builtin.MkPair', E0, E1} -> (fun (V3, V4) -> fun (V5) -> case V4 of {'Idris.Builtin.MkPair', E2, E3} -> (fun (V6, V7) -> case V7 of {'Idris.Builtin.MkPair', E4, E5} -> (fun (V8, V9) -> begin (V10 = ('Idris.Idris2.Compiler.Erlang.Codegen.NamedCExpToErlExpr':'un--genDef'(V0, V3, V1, V6, V9, V5))), case V10 of {'Idris.Prelude.Types.Left', E6} -> (fun (V11) -> {'Idris.Prelude.Types.Left', V11} end(E6)); {'Idris.Prelude.Types.Right', E7} -> (fun (V12) -> case V12 of {'Idris.Prelude.Types.Just', E8} -> (fun (V13) -> {'Idris.Prelude.Types.Right', {'Idris.Prelude.Types.Just', {'Idris.Builtin.MkPair', V3, V13}}} end(E8)); {'Idris.Prelude.Types.Nothing'} -> (fun () -> {'Idris.Prelude.Types.Right', {'Idris.Prelude.Types.Nothing'}} end()); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E7)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E4, E5)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end(E2, E3)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E0, E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end.
'un--findErlangExecutable'(V0) -> <<"erl"/utf8>>.
'un--findErlangCompiler'(V0) -> <<"erlc"/utf8>>.
'un--executeExpr'(V0, V1, V2) -> begin (V3 = ('Idris.Idris2.Compiler.Erlang.GlobalOpts':'un--defaultGlobalOpts'())), begin (V4 = <<"main"/utf8>>), fun (V5) -> begin (V6 = ('un--compileMainEntrypointToModules'(V0, V3, V2, V4, V5))), case V6 of {'Idris.Prelude.Types.Left', E0} -> (fun (V7) -> {'Idris.Prelude.Types.Left', V7} end(E0)); {'Idris.Prelude.Types.Right', E1} -> (fun (V8) -> begin (V13 = ('Idris.Idris2.Prelude.IO':'dn--un--map_Functor_IO'(fun (V9) -> case V9 of {'Idris.Prelude.Types.Left', E2} -> (fun (V10) -> {'Idris.Prelude.Types.Left', V10} end(E2)); {'Idris.Prelude.Types.Right', E3} -> (fun (V11) -> {'Idris.Prelude.Types.Right', 0} end(E3)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end, fun (V12) -> ('un--build'(V0, V3, [], V1, V1, V8, V12)) end, V5))), case V13 of {'Idris.Prelude.Types.Left', E4} -> (fun (V14) -> {'Idris.Prelude.Types.Left', V14} end(E4)); {'Idris.Prelude.Types.Right', E5} -> (fun (V15) -> begin (V17 = begin (V16 = ('un--findErlangExecutable'(V5))), {'Idris.Prelude.Types.Right', V16} end), case V17 of {'Idris.Prelude.Types.Left', E6} -> (fun (V18) -> {'Idris.Prelude.Types.Left', V18} end(E6)); {'Idris.Prelude.Types.Right', E7} -> (fun (V19) -> ('Idris.Idris2.Prelude.IO':'dn--un--map_Functor_IO'(fun (V20) -> case V20 of {'Idris.Prelude.Types.Left', E8} -> (fun (V21) -> {'Idris.Prelude.Types.Left', V21} end(E8)); {'Idris.Prelude.Types.Right', E9} -> (fun (V22) -> {'Idris.Prelude.Types.Right', 0} end(E9)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end, fun (V23) -> begin (V51 = (('Idris.Idris2.Erlang.System':'un--system'({'Idris.Prelude.IO.MkHasIO', {'Idris.Prelude.Interfaces.MkMonad', {'Idris.Prelude.Interfaces.MkApplicative', fun (V24) -> fun (V25) -> fun (V26) -> fun (V27) -> fun (V28) -> ('Idris.Idris2.Prelude.IO':'dn--un--map_Functor_IO'(V26, V27, V28)) end end end end end, fun (V29) -> fun (V30) -> fun (V31) -> V30 end end end, fun (V32) -> fun (V33) -> fun (V34) -> fun (V35) -> fun (V36) -> begin (V37 = (V34(V36))), begin (V38 = (V35(V36))), (V37(V38)) end end end end end end end}, fun (V39) -> fun (V40) -> fun (V41) -> fun (V42) -> fun (V43) -> begin (V44 = (V41(V43))), ((V42(V44))(V43)) end end end end end end, fun (V45) -> fun (V46) -> fun (V47) -> begin (V48 = (V46(V47))), (V48(V47)) end end end end}, fun (V49) -> fun (V50) -> V50 end end}, ('Idris.Idris2.Compiler.Erlang.Cmd':'un--executeBeamCmd'(V19, V1, V4))))(V23))), {'Idris.Prelude.Types.Right', V51} end end, V5)) end(E7)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E5)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end end end.
'un--defsPerModule'(V0) -> ('Idris.Idris2.Libraries.Data.SortedMap':'un--toList'(('un--groupBy'({'Idris.Prelude.EqOrd.MkOrd', {'Idris.Prelude.EqOrd.MkEq', fun (V1) -> fun (V2) -> ('Idris.Idris2.Compiler.Erlang.Name':'dn--un--==_Eq_NamespaceInfo'(V1, V2)) end end, fun (V3) -> fun (V4) -> ('Idris.Idris2.Compiler.Erlang.Name':'dn--un--/=_Eq_NamespaceInfo'(V3, V4)) end end}, fun (V5) -> fun (V6) -> ('Idris.Idris2.Compiler.Erlang.Name':'dn--un--compare_Ord_NamespaceInfo'(V5, V6)) end end, fun (V7) -> fun (V8) -> ('Idris.Idris2.Compiler.Erlang.Name':'dn--un--<_Ord_NamespaceInfo'(V7, V8)) end end, fun (V9) -> fun (V10) -> ('Idris.Idris2.Compiler.Erlang.Name':'dn--un-->_Ord_NamespaceInfo'(V9, V10)) end end, fun (V11) -> fun (V12) -> ('Idris.Idris2.Compiler.Erlang.Name':'dn--un--<=_Ord_NamespaceInfo'(V11, V12)) end end, fun (V13) -> fun (V14) -> ('Idris.Idris2.Compiler.Erlang.Name':'dn--un-->=_Ord_NamespaceInfo'(V13, V14)) end end, fun (V15) -> fun (V16) -> ('Idris.Idris2.Compiler.Erlang.Name':'dn--un--max_Ord_NamespaceInfo'(V15, V16)) end end, fun (V17) -> fun (V18) -> ('Idris.Idris2.Compiler.Erlang.Name':'dn--un--min_Ord_NamespaceInfo'(V17, V18)) end end}, fun (V19) -> ('Idris.Idris2.Builtin':'un--fst'(V19)) end, fun (V20) -> ('Idris.Idris2.Builtin':'un--snd'(V20)) end, V0)))).
'un--defLine'() -> 4242.
'un--concatNamespaceInfo'(V0, V1) -> {'Idris.Builtin.MkPair', {'Idris.Compiler.Erlang.Name.Concat', V0}, V1}.
'un--compileMainEntrypointToModules'(V0, V1, V2, V3, V4) -> begin (V5 = ('Idris.Idris2.Compiler.Common':'un--getCompileData'(V0, 0, 0, V2, V4))), case V5 of {'Idris.Prelude.Types.Left', E0} -> (fun (V6) -> {'Idris.Prelude.Types.Left', V6} end(E0)); {'Idris.Prelude.Types.Right', E1} -> (fun (V7) -> begin (V12 = case V1 of {'Idris.Compiler.Erlang.GlobalOpts.MkGlobalOpts', E2, E3, E4, E5} -> (fun (V8, V9, V10, V11) -> V11 end(E2, E3, E4, E5)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end), begin (V19 = ('Idris.Idris2.Core.Core':'un--traverse\x{27}'(fun (V13) -> ('un--genCompdef'(V12, ('un--defLine'()), ('un--concatNamespaceInfo'(V3, V13)))) end, case V7 of {'Idris.Compiler.Common.MkCompileData', E6, E7, E8, E9, E10} -> (fun (V14, V15, V16, V17, V18) -> V15 end(E6, E7, E8, E9, E10)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end, [], V4))), case V19 of {'Idris.Prelude.Types.Left', E11} -> (fun (V20) -> {'Idris.Prelude.Types.Left', V20} end(E11)); {'Idris.Prelude.Types.Right', E12} -> (fun (V21) -> begin (V22 = {'Idris.Compiler.Erlang.Name.Concat', V3}), begin (V23 = ('Idris.Idris2.Core.Core':'un--newRef'({'Idris.Compiler.Erlang.Codegen.NamedCExpToErlExpr.RtsSupport.LV'}, ('Idris.Idris2.Compiler.Erlang.IR.ErlExpr.LocalVars':'un--initLocalVars'(<<"V"/utf8>>)), V4))), case V23 of {'Idris.Prelude.Types.Left', E13} -> (fun (V24) -> {'Idris.Prelude.Types.Left', V24} end(E13)); {'Idris.Prelude.Types.Right', E14} -> (fun (V25) -> begin (V31 = (('Idris.Idris2.Compiler.Erlang.Codegen.NamedCExpToErlExpr':'un--genNmExp'(V25, V12, V22, ('Idris.Idris2.Libraries.Data.NameMap':'un--empty'()), ('Idris.Idris2.Core.CompileExpr':'un--forget'([], case V7 of {'Idris.Compiler.Common.MkCompileData', E15, E16, E17, E18, E19} -> (fun (V26, V27, V28, V29, V30) -> V26 end(E15, E16, E17, E18, E19)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end))))(V4))), case V31 of {'Idris.Prelude.Types.Left', E20} -> (fun (V32) -> {'Idris.Prelude.Types.Left', V32} end(E20)); {'Idris.Prelude.Types.Right', E21} -> (fun (V33) -> begin (V34 = ('Idris.Idris2.Compiler.Erlang.Codegen.NamedCExpToErlExpr.RtsSupport':'un--newLocalVar'(V25, V4))), case V34 of {'Idris.Prelude.Types.Left', E22} -> (fun (V35) -> {'Idris.Prelude.Types.Left', V35} end(E22)); {'Idris.Prelude.Types.Right', E23} -> (fun (V36) -> begin (V37 = (('Idris.Idris2.Compiler.Erlang.Codegen.NamedCExpToErlExpr.RtsSupport':'un--genErlMain'(V25, ('un--defLine'()), V33))(V4))), case V37 of {'Idris.Prelude.Types.Left', E24} -> (fun (V38) -> {'Idris.Prelude.Types.Left', V38} end(E24)); {'Idris.Prelude.Types.Right', E25} -> (fun (V39) -> begin (V40 = {'Idris.Compiler.Erlang.IR.ErlExpr.MkFunDecl', ('un--defLine'()), 1, <<"start"/utf8>>, [], V39}), begin (V41 = {'Idris.Compiler.Erlang.IR.ErlExpr.MkFunDecl', ('un--defLine'()), 1, <<"main"/utf8>>, [V36 | []], ('Idris.Idris2.Compiler.Erlang.Codegen.NamedCExpToErlExpr.RtsSupport':'un--genEscriptMain'(('un--defLine'()), V33))}), begin (V43 = [{'Idris.Builtin.MkPair', V22, V40} | [{'Idris.Builtin.MkPair', V22, V41} | ('Idris.Idris2.Data.List':'un--mapMaybe'(fun (V42) -> V42 end, V21))]]), {'Idris.Prelude.Types.Right', ('un--defsPerModule'(V43))} end end end end(E25)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E23)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E21)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E14)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end end(E12)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end end(E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end.
'un--compileLibraryToModules'(V0, V1, V2, V3) -> begin (V6 = ('Idris.Idris2.Data.List':'un--filter'(fun (V4) -> ('nested--9710-4127--in--un--shouldCompileName'(V3, V2, V1, V0, V3, V4)) end, ('Idris.Idris2.Prelude.Types':'dn--un--map_Functor_List'(fun (V5) -> ('Idris.Idris2.Builtin':'un--snd'(V5)) end, ('un--getExportFunNames'(V2))))))), fun (V7) -> begin (V9 = ('Idris.Idris2.Compiler.Common':'un--getExportedCompileData'(V0, 0, 0, fun (V8) -> ('nested--9710-4127--in--un--shouldCompileName'(V3, V2, V1, V0, V3, V8)) end, V6, V7))), case V9 of {'Idris.Prelude.Types.Left', E0} -> (fun (V10) -> {'Idris.Prelude.Types.Left', V10} end(E0)); {'Idris.Prelude.Types.Right', E1} -> (fun (V11) -> begin (V16 = case V1 of {'Idris.Compiler.Erlang.GlobalOpts.MkGlobalOpts', E2, E3, E4, E5} -> (fun (V12, V13, V14, V15) -> V15 end(E2, E3, E4, E5)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end), begin (V28 = ('Idris.Idris2.Core.Core':'un--traverse\x{27}'(fun (V17) -> ('un--genCompdef'(V16, ('un--defLine'()), ('un--splitNamespaceInfo'(case V1 of {'Idris.Compiler.Erlang.GlobalOpts.MkGlobalOpts', E6, E7, E8, E9} -> (fun (V18, V19, V20, V21) -> V19 end(E6, E7, E8, E9)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end, V17)))) end, ('Idris.Idris2.Data.List':'un--filter'(fun (V22) -> ('nested--9710-4127--in--un--shouldCompileName'(V3, V2, V1, V0, V3, ('Idris.Idris2.Builtin':'un--fst'(V22)))) end, case V11 of {'Idris.Compiler.Common.MkCompileData', E10, E11, E12, E13, E14} -> (fun (V23, V24, V25, V26, V27) -> V24 end(E10, E11, E12, E13, E14)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end)), [], V7))), case V28 of {'Idris.Prelude.Types.Left', E15} -> (fun (V29) -> {'Idris.Prelude.Types.Left', V29} end(E15)); {'Idris.Prelude.Types.Right', E16} -> (fun (V30) -> begin (V32 = ('Idris.Idris2.Data.List':'un--mapMaybe'(fun (V31) -> V31 end, V30))), {'Idris.Prelude.Types.Right', ('un--defsPerModule'(V32))} end end(E16)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end end(E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end end.
'un--compileLibrary'(V0, V1, V2, V3, V4, V5) -> begin (V6 = ('Idris.Idris2.Core.Context':'un--getDirectives'(V0, {'Idris.Core.Options.Other', <<"erlang"/utf8>>}, V5))), case V6 of {'Idris.Prelude.Types.Left', E0} -> (fun (V7) -> {'Idris.Prelude.Types.Left', V7} end(E0)); {'Idris.Prelude.Types.Right', E1} -> (fun (V8) -> begin (V29 = ('un--groupBy'({'Idris.Prelude.EqOrd.MkOrd', {'Idris.Prelude.EqOrd.MkEq', fun (V9) -> fun (V10) -> ('Idris.Idris2.Core.Name.Namespace':'dn--un--==_Eq_Namespace'(V9, V10)) end end, fun (V11) -> fun (V12) -> ('Idris.Idris2.Core.Name.Namespace':'dn--un--/=_Eq_Namespace'(V11, V12)) end end}, fun (V13) -> fun (V14) -> ('Idris.Idris2.Core.Name.Namespace':'dn--un--compare_Ord_Namespace'(V13, V14)) end end, fun (V15) -> fun (V16) -> ('Idris.Idris2.Core.Name.Namespace':'dn--un--<_Ord_Namespace'(V15, V16)) end end, fun (V17) -> fun (V18) -> ('Idris.Idris2.Core.Name.Namespace':'dn--un-->_Ord_Namespace'(V17, V18)) end end, fun (V19) -> fun (V20) -> ('Idris.Idris2.Core.Name.Namespace':'dn--un--<=_Ord_Namespace'(V19, V20)) end end, fun (V21) -> fun (V22) -> ('Idris.Idris2.Core.Name.Namespace':'dn--un-->=_Ord_Namespace'(V21, V22)) end end, fun (V23) -> fun (V24) -> ('Idris.Idris2.Core.Name.Namespace':'dn--un--max_Ord_Namespace'(V23, V24)) end end, fun (V25) -> fun (V26) -> ('Idris.Idris2.Core.Name.Namespace':'dn--un--min_Ord_Namespace'(V25, V26)) end end}, fun (V27) -> ('Idris.Idris2.Builtin':'un--fst'(V27)) end, fun (V28) -> ('Idris.Idris2.Builtin':'un--snd'(V28)) end, V8))), begin (V30 = ('Idris.Idris2.Data.Maybe':'un--fromMaybe'(fun () -> [] end, ('Idris.Idris2.Libraries.Data.SortedMap':'un--lookup'(('Idris.Idris2.Core.Name.Namespace':'un--emptyNS'()), V29))))), begin (V31 = ('Idris.Idris2.Libraries.Data.SortedMap':'un--toList'(('Idris.Idris2.Libraries.Data.SortedMap':'un--delete'(('Idris.Idris2.Core.Name.Namespace':'un--emptyNS'()), V29))))), begin (V35 = ('Idris.Idris2.Prelude.Types':'dn--un--map_Functor_List'(fun (V32) -> ('Idris.Idris2.Prelude.Basics':'un--uncurry'(fun (V33) -> fun (V34) -> ('Idris.Idris2.Compiler.Erlang.ModuleOpts':'un--parseModuleOpts'(V33, V34)) end end, V32)) end, V31))), begin (V36 = ('Idris.Idris2.Compiler.Erlang.GlobalOpts':'un--parseOpts'(V30))), begin (V37 = (('un--compileLibraryToModules'(V0, V36, V35, V4))(V5))), case V37 of {'Idris.Prelude.Types.Left', E2} -> (fun (V38) -> {'Idris.Prelude.Types.Left', V38} end(E2)); {'Idris.Prelude.Types.Right', E3} -> (fun (V39) -> begin (V40 = ('un--build'(V0, V36, V35, V1, V2, V39, V5))), case V40 of {'Idris.Prelude.Types.Left', E4} -> (fun (V41) -> {'Idris.Prelude.Types.Left', V41} end(E4)); {'Idris.Prelude.Types.Right', E5} -> (fun (V42) -> {'Idris.Prelude.Types.Right', {'Idris.Prelude.Types.Just', {'Idris.Builtin.MkPair', V3, V42}}} end(E5)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E3)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end end end end end end(E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end.
'un--compileExpr'(V0, V1, V2, V3, V4, V5) -> begin (V6 = ('Idris.Idris2.Core.Context':'un--getDirectives'(V0, {'Idris.Core.Options.Other', <<"erlang"/utf8>>}, V5))), case V6 of {'Idris.Prelude.Types.Left', E0} -> (fun (V7) -> {'Idris.Prelude.Types.Left', V7} end(E0)); {'Idris.Prelude.Types.Right', E1} -> (fun (V8) -> begin (V29 = ('un--groupBy'({'Idris.Prelude.EqOrd.MkOrd', {'Idris.Prelude.EqOrd.MkEq', fun (V9) -> fun (V10) -> ('Idris.Idris2.Core.Name.Namespace':'dn--un--==_Eq_Namespace'(V9, V10)) end end, fun (V11) -> fun (V12) -> ('Idris.Idris2.Core.Name.Namespace':'dn--un--/=_Eq_Namespace'(V11, V12)) end end}, fun (V13) -> fun (V14) -> ('Idris.Idris2.Core.Name.Namespace':'dn--un--compare_Ord_Namespace'(V13, V14)) end end, fun (V15) -> fun (V16) -> ('Idris.Idris2.Core.Name.Namespace':'dn--un--<_Ord_Namespace'(V15, V16)) end end, fun (V17) -> fun (V18) -> ('Idris.Idris2.Core.Name.Namespace':'dn--un-->_Ord_Namespace'(V17, V18)) end end, fun (V19) -> fun (V20) -> ('Idris.Idris2.Core.Name.Namespace':'dn--un--<=_Ord_Namespace'(V19, V20)) end end, fun (V21) -> fun (V22) -> ('Idris.Idris2.Core.Name.Namespace':'dn--un-->=_Ord_Namespace'(V21, V22)) end end, fun (V23) -> fun (V24) -> ('Idris.Idris2.Core.Name.Namespace':'dn--un--max_Ord_Namespace'(V23, V24)) end end, fun (V25) -> fun (V26) -> ('Idris.Idris2.Core.Name.Namespace':'dn--un--min_Ord_Namespace'(V25, V26)) end end}, fun (V27) -> ('Idris.Idris2.Builtin':'un--fst'(V27)) end, fun (V28) -> ('Idris.Idris2.Builtin':'un--snd'(V28)) end, V8))), begin (V30 = ('Idris.Idris2.Data.Maybe':'un--fromMaybe'(fun () -> [] end, ('Idris.Idris2.Libraries.Data.SortedMap':'un--lookup'(('Idris.Idris2.Core.Name.Namespace':'un--emptyNS'()), V29))))), begin (V31 = ('Idris.Idris2.Compiler.Erlang.GlobalOpts':'un--parseOpts'(V30))), begin (V32 = V4), begin (V33 = ('un--compileMainEntrypointToModules'(V0, V31, V3, V32, V5))), case V33 of {'Idris.Prelude.Types.Left', E2} -> (fun (V34) -> {'Idris.Prelude.Types.Left', V34} end(E2)); {'Idris.Prelude.Types.Right', E3} -> (fun (V35) -> begin (V40 = ('Idris.Idris2.Prelude.IO':'dn--un--map_Functor_IO'(fun (V36) -> case V36 of {'Idris.Prelude.Types.Left', E4} -> (fun (V37) -> {'Idris.Prelude.Types.Left', V37} end(E4)); {'Idris.Prelude.Types.Right', E5} -> (fun (V38) -> {'Idris.Prelude.Types.Right', 0} end(E5)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end, fun (V39) -> ('un--build'(V0, V31, [], V1, V2, V35, V39)) end, V5))), case V40 of {'Idris.Prelude.Types.Left', E6} -> (fun (V41) -> {'Idris.Prelude.Types.Left', V41} end(E6)); {'Idris.Prelude.Types.Right', E7} -> (fun (V42) -> {'Idris.Prelude.Types.Right', {'Idris.Prelude.Types.Just', V4}} end(E7)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E3)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end end end end end(E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end.
'un--codegenErlang'() -> {'Idris.Compiler.Common.MkCG', fun (V0) -> fun (V1) -> fun (V2) -> fun (V3) -> fun (V4) -> fun (V5) -> ('un--compileExpr'(V0, V1, V2, V3, V4, V5)) end end end end end end, fun (V6) -> fun (V7) -> fun (V8) -> ('un--executeExpr'(V6, V7, V8)) end end end, fun (V9) -> fun (V10) -> fun (V11) -> fun (V12) -> fun (V13) -> fun (V14) -> ('un--compileLibrary'(V9, V10, V11, V12, V13, V14)) end end end end end end, {'Idris.Prelude.Types.Nothing'}, {'Idris.Prelude.Types.Nothing'}}.
'un--build'(V0, V1, V2, V3, V4, V5, V6) -> begin (V8 = begin (V7 = ('un--findErlangExecutable'(V6))), {'Idris.Prelude.Types.Right', V7} end), case V8 of {'Idris.Prelude.Types.Left', E0} -> (fun (V9) -> {'Idris.Prelude.Types.Left', V9} end(E0)); {'Idris.Prelude.Types.Right', E1} -> (fun (V10) -> begin (V12 = begin (V11 = ('un--findErlangCompiler'(V6))), {'Idris.Prelude.Types.Right', V11} end), case V12 of {'Idris.Prelude.Types.Left', E2} -> (fun (V13) -> {'Idris.Prelude.Types.Left', V13} end(E2)); {'Idris.Prelude.Types.Right', E3} -> (fun (V14) -> begin (V134 = case case V1 of {'Idris.Compiler.Erlang.GlobalOpts.MkGlobalOpts', E16, E17, E18, E19} -> (fun (V15, V16, V17, V18) -> V15 end(E16, E17, E18, E19)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end of 0 -> ('Idris.Idris2.Core.Core':'un--traverse_'(fun (V19) -> ('un--writeErlangModule'(V0, V1, V2, V4, <<"erl"/utf8>>, fun (V20) -> ('un--genDeclErl'(V20)) end, V19)) end, V5, V6)); 1 -> begin (V23 = ('Idris.Idris2.Core.Core':'un--traverse\x{27}'(fun (V21) -> ('un--writeErlangModule'(V0, V1, V2, V3, <<"abstr"/utf8>>, fun (V22) -> ('un--genDeclAbstr'(V22)) end, V21)) end, V5, [], V6))), case V23 of {'Idris.Prelude.Types.Left', E4} -> (fun (V24) -> {'Idris.Prelude.Types.Left', V24} end(E4)); {'Idris.Prelude.Types.Right', E5} -> (fun (V25) -> ('Idris.Idris2.Prelude.IO':'dn--un--map_Functor_IO'(fun (V26) -> case V26 of {'Idris.Prelude.Types.Left', E6} -> (fun (V27) -> {'Idris.Prelude.Types.Left', V27} end(E6)); {'Idris.Prelude.Types.Right', E7} -> (fun (V28) -> {'Idris.Prelude.Types.Right', 0} end(E7)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end, fun (V29) -> begin (V57 = (('Idris.Idris2.Erlang.System':'un--system'({'Idris.Prelude.IO.MkHasIO', {'Idris.Prelude.Interfaces.MkMonad', {'Idris.Prelude.Interfaces.MkApplicative', fun (V30) -> fun (V31) -> fun (V32) -> fun (V33) -> fun (V34) -> ('Idris.Idris2.Prelude.IO':'dn--un--map_Functor_IO'(V32, V33, V34)) end end end end end, fun (V35) -> fun (V36) -> fun (V37) -> V36 end end end, fun (V38) -> fun (V39) -> fun (V40) -> fun (V41) -> fun (V42) -> begin (V43 = (V40(V42))), begin (V44 = (V41(V42))), (V43(V44)) end end end end end end end}, fun (V45) -> fun (V46) -> fun (V47) -> fun (V48) -> fun (V49) -> begin (V50 = (V47(V49))), ((V48(V50))(V49)) end end end end end end, fun (V51) -> fun (V52) -> fun (V53) -> begin (V54 = (V52(V53))), (V54(V53)) end end end end}, fun (V55) -> fun (V56) -> V56 end end}, ('Idris.Idris2.Compiler.Erlang.Cmd':'un--compileAbstrToErlCmd'(0, V10, V25, V4))))(V29))), {'Idris.Prelude.Types.Right', V57} end end, V6)) end(E5)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end; 2 -> ('Idris.Idris2.Core.Core':'un--traverse_'(fun (V58) -> ('un--writeErlangModule'(V0, V1, V2, V4, <<"abstr"/utf8>>, fun (V59) -> ('un--genDeclAbstr'(V59)) end, V58)) end, V5, V6)); 3 -> begin (V62 = ('Idris.Idris2.Core.Core':'un--traverse\x{27}'(fun (V60) -> ('un--writeErlangModule'(V0, V1, V2, V3, <<"erl"/utf8>>, fun (V61) -> ('un--genDeclErl'(V61)) end, V60)) end, V5, [], V6))), case V62 of {'Idris.Prelude.Types.Left', E8} -> (fun (V63) -> {'Idris.Prelude.Types.Left', V63} end(E8)); {'Idris.Prelude.Types.Right', E9} -> (fun (V64) -> ('Idris.Idris2.Prelude.IO':'dn--un--map_Functor_IO'(fun (V65) -> case V65 of {'Idris.Prelude.Types.Left', E10} -> (fun (V66) -> {'Idris.Prelude.Types.Left', V66} end(E10)); {'Idris.Prelude.Types.Right', E11} -> (fun (V67) -> {'Idris.Prelude.Types.Right', 0} end(E11)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end, fun (V68) -> begin (V96 = (('Idris.Idris2.Erlang.System':'un--system'({'Idris.Prelude.IO.MkHasIO', {'Idris.Prelude.Interfaces.MkMonad', {'Idris.Prelude.Interfaces.MkApplicative', fun (V69) -> fun (V70) -> fun (V71) -> fun (V72) -> fun (V73) -> ('Idris.Idris2.Prelude.IO':'dn--un--map_Functor_IO'(V71, V72, V73)) end end end end end, fun (V74) -> fun (V75) -> fun (V76) -> V75 end end end, fun (V77) -> fun (V78) -> fun (V79) -> fun (V80) -> fun (V81) -> begin (V82 = (V79(V81))), begin (V83 = (V80(V81))), (V82(V83)) end end end end end end end}, fun (V84) -> fun (V85) -> fun (V86) -> fun (V87) -> fun (V88) -> begin (V89 = (V86(V88))), ((V87(V89))(V88)) end end end end end end, fun (V90) -> fun (V91) -> fun (V92) -> begin (V93 = (V91(V92))), (V93(V92)) end end end end}, fun (V94) -> fun (V95) -> V95 end end}, ('Idris.Idris2.Compiler.Erlang.Cmd':'un--compileErlToBeamCmd'(V14, V64, V4))))(V68))), {'Idris.Prelude.Types.Right', V96} end end, V6)) end(E9)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end; 4 -> begin (V99 = ('Idris.Idris2.Core.Core':'un--traverse\x{27}'(fun (V97) -> ('un--writeErlangModule'(V0, V1, V2, V3, <<"abstr"/utf8>>, fun (V98) -> ('un--genDeclAbstr'(V98)) end, V97)) end, V5, [], V6))), case V99 of {'Idris.Prelude.Types.Left', E12} -> (fun (V100) -> {'Idris.Prelude.Types.Left', V100} end(E12)); {'Idris.Prelude.Types.Right', E13} -> (fun (V101) -> ('Idris.Idris2.Prelude.IO':'dn--un--map_Functor_IO'(fun (V102) -> case V102 of {'Idris.Prelude.Types.Left', E14} -> (fun (V103) -> {'Idris.Prelude.Types.Left', V103} end(E14)); {'Idris.Prelude.Types.Right', E15} -> (fun (V104) -> {'Idris.Prelude.Types.Right', 0} end(E15)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end, fun (V105) -> begin (V133 = (('Idris.Idris2.Erlang.System':'un--system'({'Idris.Prelude.IO.MkHasIO', {'Idris.Prelude.Interfaces.MkMonad', {'Idris.Prelude.Interfaces.MkApplicative', fun (V106) -> fun (V107) -> fun (V108) -> fun (V109) -> fun (V110) -> ('Idris.Idris2.Prelude.IO':'dn--un--map_Functor_IO'(V108, V109, V110)) end end end end end, fun (V111) -> fun (V112) -> fun (V113) -> V112 end end end, fun (V114) -> fun (V115) -> fun (V116) -> fun (V117) -> fun (V118) -> begin (V119 = (V116(V118))), begin (V120 = (V117(V118))), (V119(V120)) end end end end end end end}, fun (V121) -> fun (V122) -> fun (V123) -> fun (V124) -> fun (V125) -> begin (V126 = (V123(V125))), ((V124(V126))(V125)) end end end end end end, fun (V127) -> fun (V128) -> fun (V129) -> begin (V130 = (V128(V129))), (V130(V129)) end end end end}, fun (V131) -> fun (V132) -> V132 end end}, ('Idris.Idris2.Compiler.Erlang.Cmd':'un--compileAbstrToBeamCmd'(V10, V101, V4))))(V105))), {'Idris.Prelude.Types.Right', V133} end end, V6)) end(E13)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end; _ -> ('erlang':'throw'("Error: Unreachable branch")) end), case V134 of {'Idris.Prelude.Types.Left', E20} -> (fun (V135) -> {'Idris.Prelude.Types.Left', V135} end(E20)); {'Idris.Prelude.Types.Right', E21} -> (fun (V136) -> {'Idris.Prelude.Types.Right', ('Idris.Idris2.Prelude.Types':'dn--un--map_Functor_List'(fun (V137) -> ('Idris.Idris2.Compiler.Erlang.Name':'un--currentModuleName'(('Idris.Idris2.Builtin':'un--fst'(V137)))) end, V5))} end(E21)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E3)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end end(E1)); _ -> ('erlang':'throw'("Error: Unreachable branch")) end end.
