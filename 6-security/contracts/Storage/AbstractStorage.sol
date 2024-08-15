// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

abstract contract AbstractStorage {
    uint256 internal storedValue;

    // Concrete function to store a value
    function store(uint256 _value) public {
        storedValue = _value;
    }

    // Abstract function to retrieve the stored value
    function retrieve() public view virtual returns (uint256);
}