// SPDX-License-Identifier: MIT

// 智能合约的许可协议
pragma solidity >=0.8.0 < 0.9.0;

contract ErrorDemo {
    uint public x = 100;

    function doAssert()  public returns(uint) {
        require(50 > 100, unicode"50怎么能大于100");
        // assert(50 > 100);
        x = 200;
        return x;
    }

    uint public y = 200;

}