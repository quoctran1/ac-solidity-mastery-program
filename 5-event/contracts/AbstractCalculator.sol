// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;
abstract contract AbstractCalculator {
    function add(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }
    function sub(uint256 a, uint256 b) public pure returns (uint256) {
        return a - b;
    }
}
