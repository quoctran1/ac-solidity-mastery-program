// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract Calculator {
    uint public result;
    // address payable public owner;

    // event AddNumber(uint first, uint second);
    // event SubtractNumber(uint first, uint second);
    // event MultiplyNumber(uint first, uint second);
    constructor() {}

    function addNumber(uint first, uint second) public {
        result = first + second;
    }
    function subtractNumber(uint first, uint second) public {
        require(
            first >= second,
            "Subtraction would result in a negative number"
        );
        result = first - second;
    }
    function multiplyNumber(uint first, uint second) public {
        result = first * second;
    }
}
