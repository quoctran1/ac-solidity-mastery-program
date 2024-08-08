// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;
import {ICalculator} from "./ICalculator.sol";
contract InterfaceCalculator is ICalculator {
    function add(uint a, uint b) public pure returns (uint) {
        return a + b;
    }
    function subtract(uint a, uint b) public pure returns (uint) {
        return a - b;
    }
}
