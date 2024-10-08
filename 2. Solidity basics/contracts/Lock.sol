// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract Lock {
    uint public unlockTime;
    address payable public owner;
    error InvalidUnlockTime(uint unlockTime, uint currentTime);
    event Withdrawal(uint amount, uint when);
    modifier onlyOwner() {
        require(msg.sender == owner, "You aren't the owner");
        _;
    }
    constructor(uint _unlockTime) payable {
        require(
            block.timestamp < _unlockTime,
            "Unlock time should be in the future"
        );

        unlockTime = _unlockTime;
        owner = payable(msg.sender);
    }

    function withdraw() public onlyOwner {
        // Uncomment this line, and the import of "hardhat/console.sol", to print a log in your terminal
        // console.log("Unlock time is %o and block timestamp is %o", unlockTime, block.timestamp);

        if (block.timestamp <= unlockTime)
            revert InvalidUnlockTime(unlockTime, block.timestamp);
      
        require(address(this).balance >= 0.1 ether, "Your balance must greater or atleast equal 0.1 ETH");

        emit Withdrawal(address(this).balance, block.timestamp);

        // owner.transfer(address(this).balance);
    }
}
