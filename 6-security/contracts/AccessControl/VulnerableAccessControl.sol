// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract VulnerableAccessControl {
    address payable public owner;
    modifier onlyOwer() {
        // Modifier
        require(msg.sender == owner, "You aren't the owner");
        _;
    }
    constructor() payable {
        require(msg.value >= 0.01 ether, "not enough Metis");
        owner = payable(msg.sender);
    }
    // Unrestricted function to set a new owner

    function setOwner(address _newOwnert) public onlyOwer {
        owner = payable(_newOwnert);
    }

    function withdraw(uint _amountt) public {
        owner.transfer(_amountt);
    }
}
