// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;
import {IStore} from "./IStore.sol";
import {AbstractStorage} from "./AbstractStorage.sol";
contract SimpleStorage is IStore {
    uint256 temp;
    function store(uint a) external {
        temp = a;
    }
    function retrieve() external view returns (uint256) {
        return temp;
    }
}

contract ConcreteSimpleStorage is AbstractStorage {
    // Abstract function to retrieve the stored value
    function retrieve() public view override returns (uint256) {
        return storedValue;
    }
}
