"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const getChildNodes_1 = __importDefault(require("./getChildNodes"));
// If the node is a type of assignment or if the node is a paren and nested
// inside that paren is a node that is a type of assignment.
function containsAssignment(node) {
    if (!node) {
        return false;
    }
    if (["assign", "massign", "opassign"].includes(node.type)) {
        return true;
    }
    return (0, getChildNodes_1.default)(node).some(containsAssignment);
}
exports.default = containsAssignment;
