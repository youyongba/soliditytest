// SPDX-License-Identifier: MIT

// 智能合约的许可协议
pragma solidity ^0.8.7;

contract Visible {
    uint private  x;

    constructor(uint  _x) {
        x = _x;
    }

    function getX() external view returns(uint) {
        return x;
    }
}