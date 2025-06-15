// SPDX-License-Identifier: MIT

// 智能合约的许可协议
pragma solidity >=0.8.0 < 0.9.0;

// 结构体基础知识
contract StructType {
    struct Person {
        string name;
        string gender;
        uint age;
    }

    Person public person;

    function initial(string calldata name, string calldata gender, uint age)  public {
        person.name = name;
        person.gender = gender;
        person.age = age;
    }

    
}