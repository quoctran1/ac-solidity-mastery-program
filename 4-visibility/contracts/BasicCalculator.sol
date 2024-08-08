// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract BasicCalculator {
    uint256 result;
    function add(uint256 a, uint256 b) internal {
        result = a + b;
    }
    function substract(uint256 a, uint256 b) internal {
        assert(a>=b);
        result = a - b;
    }
}

contract AdvancedCalculator is BasicCalculator {
    function multiply(uint256 a, uint256 b) private {
        assert(a!=0&&b!=0);
        result = a * b;
    }
    function divide(uint256 a, uint256 b) private {
        assert(a!=0&&b!=0);
        result = a / b;
    }
    function performOperation(uint256 a, uint256 b, uint8 operation) public {
        if (operation == 1) {
            add(a, b);
        } else if (operation == 2) {
            substract(a, b);
        } else if (operation == 3) {
            multiply(a, b);
        } else if (operation == 4) {
            divide(a, b);
        } else {
            revert("unkown");
        }
    }
    function getResult() external view returns (uint256) {
        return result;
    }
}
