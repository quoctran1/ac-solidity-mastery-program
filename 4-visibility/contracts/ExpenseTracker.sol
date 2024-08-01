// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract ExpenseTracker {
    struct Expense {
        address user;
        string destription;
        uint amount;
    }
    Expense[] public expenses;
    constructor() {
        expenses.push(Expense(msg.sender, "Groceries", 50));
        expenses.push(Expense(msg.sender, "Transportation", 30));
        expenses.push(Expense(msg.sender, "Dining out", 20));
    }

    function addExpense(
        string memory description_,
        uint  amount_
    ) public {
        expenses.push(Expense(msg.sender, description_, amount_));
    }
    function getTotalExpenses(address user_) public view returns (uint) {
        uint sum=0;
      for(uint i=0;i<=expenses.length;i++){
            sum+=expenses[i].amount;
      }
      return sum;
    }
}
