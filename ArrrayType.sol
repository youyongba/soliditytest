// SPDX-License-Identifier: MIT

// 智能合约的许可协议
pragma solidity >=0.8.0 < 0.9.0;

contract ArrayType {
    uint[5] arr  = [2,3,4,5,6];

    function getArr() public view returns(uint[5] memory) {
        return arr;
    }

    function sumArray () public view returns (uint) {
        uint sum = 0;

        for (uint i = 0; i <arr.length; i++) {
            sum += arr[i];
        }

        return sum;
    }

    function changeArray(uint _num) public {
        arr[1] = _num;
    }

    function pushArray(uint _num) public {
        // push pop修改是不行的
        // arr.push(_num);
        // arr.pop(_num);
    }
}

contract ArrayType2 {
    // uint[] arr = [0];
    uint[] arr;

    function getArr() public view returns(uint[] memory) {
        return arr;
    }

    function length() public view returns(uint) {
        return arr.length;
    }

    function push(uint ele) public {
        arr.push(ele);
    }
}


// 定长的二维数组
contract ArrayType3 {
    uint[2][2] arr = [[1,2],[1,2]];

    function setArr(uint x) public {
        arr[0][0] = x;
    }

    function showArr() public view  returns(uint[2][2] memory) {
        return arr;
    }
}


// 不定长的二维数组
contract ArrayType4 {
    uint[][] arr = [[1,2],[1,2]];
    // uint[][] arr;

    function setArr(uint x) public {
        arr[0][0] = x;
    }

    function showArr() public view  returns(uint[][] memory) {
        return arr;
    }
    
    function push(uint x) public {
        arr[0].push(x);
    }
}