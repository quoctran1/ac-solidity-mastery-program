// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;
library Math {
    function add(uint a, uint b) internal pure returns (uint) {
        return a + b;
    }
    function divine(uint a, uint b) internal pure returns (uint) {
        return a / b;
    }
    function multiply(uint a, uint b) internal pure returns (uint) {
        return a * b;
    }
    function subtract(uint a, uint b) internal pure returns (uint) {
        return a - b;
    }
}
