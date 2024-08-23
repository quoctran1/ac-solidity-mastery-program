// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract Lock {
    uint public unlockTime;
    address payable public owner;

    error InvalidUnlockTime(uint unlockTime, uint currentTime);
    event Withdrawal(uint amount, uint when);

    modifier onlyOwer() {
        // Modifier
        require(msg.sender == owner, "You aren't the owner");
        _;
    }

    constructor(uint _unlockTime) payable {
        require(
            block.timestamp < _unlockTime,
            "Unlock time should be in the future"
        );
            require(
            msg.value>=0.000000001 ether ,
            uintToString(msg.value)
        );
        unlockTime = _unlockTime;
        owner = payable(msg.sender);
    }
 
    function withdraw() public onlyOwer {
        // Uncomment this line, and the import of "hardhat/console.sol", to print a log in your terminal
        // console.log("Unlock time is %o and block timestamp is %o", unlockTime, block.timestamp);

        if (block.timestamp < unlockTime)
            revert InvalidUnlockTime(unlockTime, block.timestamp);

        emit Withdrawal(address(this).balance, block.timestamp);

        owner.transfer(address(this).balance);
    }
    function uintToString(uint256 _i) public pure returns (string memory) {
        if (_i == 0) {
            return "0";
        }
        uint256 j = _i;
        uint256 length;

        // Calculate the length of the string representation
        while (j != 0) {
            length++;
            j /= 10;
        }

        // Create a bytes array of the calculated length
        bytes memory bstr = new bytes(length);
        uint256 k = length;

        // Convert the number to its string representation
        while (_i != 0) {
            k = k - 1;
            uint8 temp = (48 + uint8(_i - (_i / 10) * 10));
            bytes1 b1 = bytes1(temp);
            bstr[k] = b1;
            _i /= 10;
        }

        // Return the string
        return string(bstr);
    }
}
