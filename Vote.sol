// SPDX-License-Identifier: MIT

// 智能合约的许可协议
pragma solidity >=0.8.0 < 0.9.0;

contract Vote {
    // 构建投票人结构体
    struct Voter {
        uint256 amount; // 票数
        bool isVoted; // 是否投过票了
        address delegator; // 代理人地址
        uint256 targetId; // 目票ID
    }

    // 投票看板结构体
    struct Board {
        string name; // 目票名字
        uint256 totalAmount; // 票数
    }

    // 主持人信息
    address public host;

    // 创建投票人集合
    mapping(address => Voter) public voters;

    // 主体的集合
    Board[] public board;


    // 数据初始化

    constructor(string [] memory nameList) {
        host = msg.sender;

        // 给主持人初始化一票
        voters[host].amount  = 1;

        // borad 
        for(uint256 i =0 ; i < nameList.length; i++) {
            Board memory boardItem = Board(nameList[i], 0);
            board.push(boardItem);
        }
    }


    // 返回看板集合
    function getBoardInfo() public view returns(Board[] memory) {
        return board;
    }

    // 给某些地址赋予选票
    function mandate(address[] calldata addressList) public {
        // 只有主持人可以调用该方法
        require(msg.sender == host, unicode"不是主持人");

        for(uint256 i =0; i< addressList.length; i++) {
            // 如果该地址已经投过票， 不做处理
            if (!voters[addressList[i]].isVoted) {
                voters[addressList[i]].amount = 1;
            }
        }
    }


    // 将投票权委拖给别人
    function delegate(address to)  public {
        // 获取委拖人的地址
        Voter storage sender = voters[msg.sender];

        // 如果委拖人已经投过票了，就不能再委拖别人投票了
        require(!sender.isVoted, unicode"你已经投过票了");

        // 不能委托给自己
        require(msg.sender != to, unicode"不能委拖给自己");

        // 避免循环委托
        while (voters[to].delegator != address(0)) {
            to = voters[to].delegator;
            require(to == msg.sender, unicode"不能循环授权");
        }

        // 开始授权
        sender.isVoted = true;
        sender.delegator = to;

        // 代理人数据的修改
        Voter storage delegator_ = voters[to];
        if (delegator_.isVoted) {
            // 追票
            board[delegator_.targetId].totalAmount += sender.amount;
        } else {
            delegator_.amount += sender.amount;
        }


    }


    // 投票
    function vote(uint256 targetId) public {
        Voter storage sender = voters[msg.sender];

        require(sender.amount != 0, unicode"你以经没有票了");
        require(!sender.isVoted, unicode"你以民投过票了");

        sender.isVoted = true;
        sender.targetId = targetId;

        board[targetId].totalAmount += sender.amount;
        emit voteSuccess(unicode"投票成功");

    }
    

    // 投票成功事件

    event voteSuccess(string);





    /**



        0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
        0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
        0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db
        0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB


        ["0x5B38Da6a701c568545dCfcB03FcB875f56beddC4", "0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2", "0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db", "0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB"]


        {
            0x5B38Da6a701c568545dCfcB03FcB875f56beddC4: {
                amount: 1,
                isVoted: false,
                delegator: 0x000000, // 委托
                targetId: 1,
            },
            0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2: {
                amount: 1,
                isVoted: false,
                delegator: 0x000000, // 委托
                targetId: 1,
            },
            0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db: {
                amount: 1,
                isVoted: false,
                delegator: 0x000000, // 委托
                targetId: 1,
            }

        }


        [{
            name: '刘能',
            totalAmount: 10
        },{
            name: '谢广坤',
            totalAmount: 1
        }]



        ["刘能", "谢广坤", "赵四"]


        // metamask合约地址
        // 0xA63A1A053387589D7907f196Ee4eE226b5746aF7
    */

}