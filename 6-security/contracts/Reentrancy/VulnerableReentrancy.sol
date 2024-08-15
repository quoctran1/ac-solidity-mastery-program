// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.24;

contract VulnerableReentrancy {
    mapping(address => uint) public balances;

    function deposit() public payable {
         assert(msg.value >= 0.1 ether);
        balances[msg.sender] += msg.value;
    }
    function withdraw(uint _amountt) public {
        assert(balances[msg.sender] >= _amountt );
        balances[msg.sender] -= _amountt;

        (bool success, ) = msg.sender.call{value: _amountt}("");
        require(success, "Transfer failed");
    }
}

