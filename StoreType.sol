// SPDX-License-Identifier: MIT

// 智能合约的许可协议
pragma solidity >=0.8.0 < 0.9.0;

contract StoreType {
    // 默认是Storage 类型
    // 占用一个256位的槽需要消耗20000 gas
    // 修改一个已使用的存储槽的值，需要消耗5000 gas
    string name;
    // memory 临时位置，类似计算机里的内存，一担执行完，就会消除
    // 内存是一个字节数组，槽大小位256位（32字节）
    // 读或写一个内存槽都会消耗 3 gas
    // 为了避免矿工的工作量过大， 22个操作之后的单操作成本会上涨
    // 值类型可以不用memory ,引用类型需要memory


    // calldata 
    // calldata一般作为external或者public函数的参数使用
    // 它只能用于函数声明参数（而不是函数逻辑）
    // 它是不可变的（不能被覆盖和更改）
    // 它必须用于external函数的动态参数
    // 它是临时的（该值在事务完成后会销毁）
    // 它是最便宜的存储位置


    // Stack
    // stack 保存很小的局部变量， 免费使用， 但有数量限制。


    
}

contract Person {
    struct State {
        string name;
        string gender;
    }

    State public state;

    function setState(string calldata _name, string calldata _gender) external {
        state.name = _name;
        state.gender = _gender;
    }

    function getName() external view returns(string memory) {
        return state.name;
    }

    function changeGender(uint value)  external {

        require(value == 0 || value == 1, unicode"输入错误");
        string memory newGender;
        
        if (value == 0) {
            newGender = "female";
        } else {
            newGender = "male";
        }

        state.gender = newGender;
    }
    

}


// Stack
contract Counter {
    function start() external pure returns(uint sum) {
        uint a1 = 1;
        uint a2 = 1;
        uint a3 = 1;
        uint a4 = 1;
        uint a5 = 1;
        uint a6 = 1;
        uint a7 = 1;
        uint a8 = 1;
        // uint a9 = 1;

        // uint a10 = 1;
        // uint a11 = 1;
        // uint a12 = 1;
        // uint a13 = 1;
        // uint a14 = 1;
        // uint a15 = 1;

        // sum = a1+a2+a3+a4+a5+a6+a7+a8+a9+a10+a11+a12+a13+a14+a15;
        // sum = a1+a2+a3+a4+a5+a6+a7+a8+a9;
        sum = a1+a2+a3+a4+a5+a6+a7+a8;
        return sum;
    } 
}




