// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;
import {Math} from "./library/Math.sol";
contract MathExample{
    using Math for uint;
    function calculate (uint a, uint b) public pure returns (uint) {
        return a.add(b);
    }
}