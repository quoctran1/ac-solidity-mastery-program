// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;
interface IStore {
    function store(uint a) external;
    function retrieve() external returns (uint);
}
