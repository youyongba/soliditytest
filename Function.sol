// SPDX-License-Identifier: MIT

// 智能合约的许可协议
pragma solidity >=0.8.0 < 0.9.0;

contract Function {
    string public name = 'felixlu';

    // 修改状态变量不需要加pure 和 view
    function setName(string memory _name) public returns(string memory) {
        name = _name;
        return printName(name);
    }

    // 纯函数没有状态变量用pure
    function foo() public pure returns(string memory){
        string memory str = 'hello';
   
        return str;
    }

    // 显示状态变量用view 
    function fzz() public view returns(string memory){
        return name;
    }
}

// 公共函数
function printName (string memory _name) pure  returns(string memory) {
    return _name;
}

