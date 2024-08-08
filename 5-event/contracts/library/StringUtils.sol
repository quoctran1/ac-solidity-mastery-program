// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;
library StringUtils {
    // Function to concatenate two strings
    function concatenate(
        string memory _a,
        string memory _b
    ) internal pure returns (string memory) {
        return string(abi.encodePacked(_a, _b));
    }

    // Function to check if two strings are equal
    function equals(
        string memory _a,
        string memory _b
    ) internal pure returns (bool) {
        return
            keccak256(abi.encodePacked(_a)) == keccak256(abi.encodePacked(_b));
    }

    // Function to get the length of a string
    function length(string memory _str) internal pure returns (uint) {
        return bytes(_str).length;
    }
}
