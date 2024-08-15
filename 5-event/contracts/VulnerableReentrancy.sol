// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.24;

contract VulnerableReentrancy {
    mapping(address => uint) public balances;

    function deposit() public payable {
         require(msg.value >= 0.1 ether, "Not enough");
        balances[msg.sender] += msg.value;
    }
    function withdraw(uint _amountt) public {
        require(balances[msg.sender] >= _amountt, "Insufficient balance");
        (bool success, ) = msg.sender.call{value: _amountt}("");
        require(success, "Transfer failed");
        balances[msg.sender] -= _amountt;
    }
}
