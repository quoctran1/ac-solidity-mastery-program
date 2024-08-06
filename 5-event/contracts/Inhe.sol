// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;
contract Animal {
    function eat() public pure returns (string memory) {
        return "Eating";
    }
}
contract Dog is Animal {
    function bark() public pure returns (string memory) {
        return "Barking";
    }
}
