"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const isEmptyStmts_1 = __importDefault(require("./isEmptyStmts"));
function isEmptyBodyStmt(node) {
    return (0, isEmptyStmts_1.default)(node.stmts) && !node.rsc && !node.ens && !node.els;
}
exports.default = isEmptyBodyStmt;
