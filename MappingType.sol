// SPDX-License-Identifier: MIT

// 智能合约的许可协议
pragma solidity >=0.8.0 < 0.9.0;

contract MappingType {
    mapping(address => uint256)  balances;
    mapping(address => mapping(address => uint)) xxx;
    
    
    /**
    
        {
            0x5B38Da6a701c568545dCfcB03FcB875f56beddC4: 10000,
            0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2: 20000,
        }

        {
            0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db: {
                0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db: 30000
            },
            0x617F2E2fD72FD9D5503197092aC168c91465E7f2: {
                0x17F6AD8Ef982297579C203069C1DbfFE4348c372: 30000
            }
        }

    */

    function setBalances(uint256 amount) public {
        balances[msg.sender] = amount;
    }

    function getBlanceOf() public view returns(uint256) {
        return balances[msg.sender];
    }
}