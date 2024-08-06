// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract SimpleStorage {
    uint256 public storedData;
    // Define an event
    event DataStored(address indexed sender, uint256 data);
    // Function to store data

    function set(uint256 x) public {
        storedData = x;
        // Emit event
        emit DataStored(msg.sender, x);
    }
    // Function to retrieve data

    function get() public view returns (uint256) {
        return storedData;
    }
}
