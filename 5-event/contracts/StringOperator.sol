// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;
import {StringUtils} from "./library/StringUtils.sol";
contract StringOperator {
    using StringUtils for string;
    function concatenateString(
        string memory _a,
        string memory _b
    ) public pure returns (string memory) {
        string memory concatenated = _a.concatenate(_b);
        return concatenated;
    }
    function compareString(string memory _a,string memory _b)public pure returns (bool ){
        return _a.equals(_b);
    }
}
