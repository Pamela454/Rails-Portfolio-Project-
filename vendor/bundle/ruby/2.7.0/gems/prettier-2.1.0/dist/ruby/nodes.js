"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const alias_1 = require("./nodes/alias");
const aref_1 = require("./nodes/aref");
const args_1 = require("./nodes/args");
const arrays_1 = require("./nodes/arrays");
const assign_1 = require("./nodes/assign");
const blocks_1 = require("./nodes/blocks");
const calls_1 = require("./nodes/calls");
const case_1 = require("./nodes/case");
const class_1 = require("./nodes/class");
const commands_1 = require("./nodes/commands");
const conditionals_1 = require("./nodes/conditionals");
const constants_1 = require("./nodes/constants");
const flow_1 = require("./nodes/flow");
const hashes_1 = require("./nodes/hashes");
const heredocs_1 = require("./nodes/heredocs");
const hooks_1 = require("./nodes/hooks");
const ints_1 = require("./nodes/ints");
const lambdas_1 = require("./nodes/lambdas");
const loops_1 = require("./nodes/loops");
const massign_1 = require("./nodes/massign");
const methods_1 = require("./nodes/methods");
const operators_1 = require("./nodes/operators");
const params_1 = require("./nodes/params");
const patterns_1 = require("./nodes/patterns");
const regexp_1 = require("./nodes/regexp");
const rescue_1 = require("./nodes/rescue");
const return_1 = require("./nodes/return");
const statements_1 = require("./nodes/statements");
const strings_1 = require("./nodes/strings");
const super_1 = require("./nodes/super");
const undef_1 = require("./nodes/undef");
const printToken = (path) => path.getValue().value;
const printVoidStmt = () => "";
const nodes = {
    BEGIN: hooks_1.printBEGIN,
    CHAR: strings_1.printChar,
    END: hooks_1.printEND,
    __end__: statements_1.printEndContent,
    access_ctrl: methods_1.printAccessControl,
    alias: alias_1.printAlias,
    aref: aref_1.printAref,
    aref_field: aref_1.printArefField,
    arg_paren: args_1.printArgParen,
    args: args_1.printArgs,
    args_add_block: args_1.printArgsAddBlock,
    args_forward: params_1.printArgsForward,
    arg_star: args_1.printArgStar,
    array: arrays_1.printArray,
    aryptn: patterns_1.printAryPtn,
    assign: assign_1.printAssign,
    assoc: hashes_1.printAssoc,
    assoc_splat: hashes_1.printAssocSplat,
    assoclist_from_args: hashes_1.printHashContents,
    backref: printToken,
    backtick: printToken,
    bare_assoc_hash: hashes_1.printHashContents,
    begin: rescue_1.printBegin,
    binary: operators_1.printBinary,
    block_var: blocks_1.printBlockVar,
    blockarg: args_1.printBlockArg,
    bodystmt: statements_1.printBodyStmt,
    brace_block: blocks_1.printBraceBlock,
    break: flow_1.printBreak,
    call: calls_1.printCall,
    case: case_1.printCase,
    class: class_1.printClass,
    command: commands_1.printCommand,
    command_call: commands_1.printCommandCall,
    comment: statements_1.printComment,
    const: printToken,
    const_path_field: constants_1.printConstPath,
    const_path_ref: constants_1.printConstPath,
    const_ref: constants_1.printConstRef,
    cvar: printToken,
    def: methods_1.printDef,
    def_endless: methods_1.printDefEndless,
    defined: constants_1.printDefined,
    defs: methods_1.printDef,
    do_block: blocks_1.printDoBlock,
    dot2: operators_1.printDot2,
    dot3: operators_1.printDot3,
    dyna_symbol: strings_1.printDynaSymbol,
    else: conditionals_1.printElse,
    elsif: conditionals_1.printElsif,
    embdoc: statements_1.printComment,
    ensure: rescue_1.printEnsure,
    excessed_comma: params_1.printExcessedComma,
    fcall: calls_1.printCallContainer,
    field: constants_1.printField,
    float: printToken,
    fndptn: patterns_1.printFndPtn,
    for: loops_1.printFor,
    gvar: printToken,
    hash: hashes_1.printHash,
    heredoc: heredocs_1.printHeredoc,
    heredoc_beg: printToken,
    hshptn: patterns_1.printHshPtn,
    ident: printToken,
    if: conditionals_1.printIf,
    if_mod: conditionals_1.printIfModifier,
    ifop: conditionals_1.printTernary,
    imaginary: printToken,
    in: patterns_1.printIn,
    int: ints_1.printInt,
    ivar: printToken,
    kw: printToken,
    kwrest_param: params_1.printKeywordRestParam,
    label: printToken,
    lambda: lambdas_1.printLambda,
    lbrace: printToken,
    lparen: printToken,
    massign: massign_1.printMAssign,
    method_add_arg: calls_1.printMethodAddArg,
    method_add_block: calls_1.printMethodAddBlock,
    mlhs: massign_1.printMLHS,
    mlhs_paren: massign_1.printMLHSParen,
    module: class_1.printModule,
    mrhs: massign_1.printMRHS,
    mrhs_add_star: massign_1.printMRHSAddStar,
    mrhs_new_from_args: massign_1.printMRHSNewFromArgs,
    next: flow_1.printNext,
    not: operators_1.printNot,
    op: printToken,
    opassign: assign_1.printOpAssign,
    params: params_1.printParams,
    paren: statements_1.printParen,
    period: printToken,
    program: statements_1.printProgram,
    qsymbols: arrays_1.printQsymbols,
    qwords: arrays_1.printQwords,
    rassign: patterns_1.printRAssign,
    rational: printToken,
    redo: rescue_1.printRedo,
    regexp_literal: regexp_1.printRegexpLiteral,
    rescue: rescue_1.printRescue,
    rescue_ex: rescue_1.printRescueEx,
    rescue_mod: rescue_1.printRescueMod,
    rest_param: params_1.printRestParam,
    retry: rescue_1.printRetry,
    return0: return_1.printReturn0,
    return: return_1.printReturn,
    sclass: class_1.printSClass,
    statements: statements_1.printStatements,
    string_concat: strings_1.printStringConcat,
    string_dvar: strings_1.printStringDVar,
    string_embexpr: strings_1.printStringEmbExpr,
    string_literal: strings_1.printStringLiteral,
    super: super_1.printSuper,
    symbol_literal: strings_1.printSymbolLiteral,
    symbols: arrays_1.printSymbols,
    top_const_field: constants_1.printTopConst,
    top_const_ref: constants_1.printTopConst,
    tstring_content: printToken,
    unary: operators_1.printUnary,
    undef: undef_1.printUndef,
    unless: conditionals_1.printUnless,
    unless_mod: conditionals_1.printUnlessModifier,
    until: loops_1.printUntil,
    until_mod: loops_1.printUntil,
    var_alias: alias_1.printAlias,
    var_field: assign_1.printVarField,
    var_ref: assign_1.printVarRef,
    vcall: calls_1.printCallContainer,
    void_stmt: printVoidStmt,
    when: case_1.printWhen,
    while: loops_1.printWhile,
    while_mod: loops_1.printWhile,
    word: arrays_1.printWord,
    words: arrays_1.printWords,
    xstring_literal: strings_1.printXStringLiteral,
    yield0: flow_1.printYield0,
    yield: flow_1.printYield,
    zsuper: super_1.printZSuper
};
exports.default = nodes;
