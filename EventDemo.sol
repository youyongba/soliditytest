// SPDX-License-Identifier: MIT

// 智能合约的许可协议
pragma solidity >=0.8.0 < 0.9.0;

contract EventDemo {
    event Log(uint);
    event Log(string);
    event Log(address);

    function foo() public {
        emit Log(100);
        emit Log(unicode"你好世界");
        emit Log(unicode"hello world");
        emit Log(msg.sender);
    }
}