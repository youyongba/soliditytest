// SPDX-License-Identifier: MIT

// 智能合约的许可协议
pragma solidity >=0.8.0 < 0.9.0;


/**
 Solidity数据类型
    值类型
        布尔- bool
        整型- int/uint
        地址- address
        定长字节数组 
        定长浮点 fixed / ufixed
        枚举 enum
        函数 function

    引用类型
        数组 Array 
            不定长字节数组
            字符串
        结构体 struct
        映射 mapping
 */


contract DataType {
    int x = -100;
    uint y = 10;

    int8 z = 127;



    // int 的最大最小值
    int public minInt8 = type(int8).min;
    int public maxInt8 = type(int8).max;

    // uint 的最大最小值
    uint public minUInt8 = type(uint8).min;
    uint public maxUInt8 = type(uint8).max;


    // int 的最大最小值, 默认256
    int public minInt = type(int).min;
    int public maxInt = type(int).max;

    // uint 的最大最小值 默认256
    uint public minUInt = type(uint).min;
    uint public maxUInt = type(uint).max;

    constructor() payable {

    }



    address public a = msg.sender;

    address public b = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    address public c = address(this);

}


contract StringType {
    // string str = unicode"你好";

    string public str1 = unicode"123";

    // 中文不适用unicode编码报错
    string public str2 = unicode"abc";

    // function concat() public view returns (string memory) {
    //     string memory result = string.concat(str1, str2);
    //     return result;
    // }

    function concat2(string memory _a, string memory _b) public pure returns(bytes memory) {
        bytes memory _ba = bytes(_a);
        bytes memory _bb = bytes(_b);
        return bytes.concat(_ba, _bb);
    }


    function concat3(string memory _a, string memory _b) public view returns(string memory) {
        bytes memory _ba = bytes(str1);
        bytes memory _bb = bytes(str2);
        return string(bytes.concat(_ba, _bb));
    }


    function concat4(string memory _a, string memory _b) public view returns(string memory) {
        bytes memory _ba = bytes(_a);
        bytes memory _bb = bytes(_b);
        return string(bytes.concat(_ba, _bb));
    }
    

    function testString() public view returns(uint) {
        // return bytes(str1)
        // solidity 求长度的一种方法
        bytes memory a = bytes(str1);
        return a.length;
    }


}