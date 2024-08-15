// SPOX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract VulnerableExternalCall {
    mapping(address => uint) public balances;
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint _amountt) public {
        require(balances[msg.sender] >= _amountt, "Insufficient balance");
        balances[msg.sender] -= _amountt;

        // Unchecked external call
        (bool success, ) = msg.sender.call{value: _amountt}("");
        require(success,"Transfer failed");
    }
}
