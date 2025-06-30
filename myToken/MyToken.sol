// SPDX-License-Identifier: MIT

// 智能合约的许可协议
pragma solidity >=0.8.0 < 0.9.0;

// 这个代币还有一个机制，就是没有燃烧机制，参考代码在这个位置
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol
/**
  function _burn(address account, uint256 value) internal {
        if (account == address(0)) {
            revert ERC20InvalidSender(address(0));
        }
        _update(account, address(0), value);
    }
*/



import './Context.sol';



contract MyToken is Context {

    // - 1、代币的信息 -
    
    // 代币名称 name
    string private _name;
    // 代币的标识 symbol
    string private _symbol;
    // 代币的小数位置 decimals
    uint8 private _decimals;
    // 代币的总发行量 totalSupply
    uint256 private _totalSupply;
    // 代币数量 balance
    mapping(address => uint256) private _balances;
    // 授权代币数量 allowance
    mapping(address => mapping(address => uint256)) private _allowances;
    

    // - 2、初始化 -

    constructor () {
        _name = "QiCoin";
        _symbol = "qiqi";
        _decimals = 18;
        
        // 初始化货币池
        _mint(_msgSender(), 100 * 10000 * 10**_decimals);
        
                
    }

    // - 3、取值器 - 
    
    // 返回代币的名字 name()
    function name() public view returns (string memory) {
        return _name;
    }

    // 返回代币标识 symbol()
    function symbol() public view returns(string memory) {
        return _symbol;
    }

    // 返回代币的小数位数 decimals()
    function decimals() public view returns (uint8) {
        return _decimals;
    }

    // 返回代币总发行量 totalSupply()
    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    // 返回账户拥有的代币数量 balanceOf()
    function balanceOf(address account) public view returns (uint256 balance) {
        return _balances[account];
    }

    // 返回授权代币数量 allowance()
    function allowanceOf(address owner, address spender) public view returns(uint256) {
        return _allowances[owner][spender];
    }
    

    // - 4、函数 - 
    // 代币的转发 transfer()
    function transfer(address to, uint256 amount) public returns (bool) {

        address owner = _msgSender();
        // 实现转账
        _transfer(owner, to, amount);
        return true;
    }


    // 授权代币的转发
    function approve(address spender, uint256 amount) public returns (bool) {
        // 银行授权给我（银行要贷款华人我）
        address owner = _msgSender();
        // owner 是授权人
        // spender 被授权人
        _approve(owner, spender, amount);
        return true;
    }

    // 授权代币转发, 不知道是不是提款功能 transferFrom 
    function transferFrom(address from, address to, uint256 amount) public returns (bool) {
        address owner = _msgSender();

        // 更新授权账户信息
        _spendAllowance(from, owner, amount);

        // 执行转账
        // from: 银行，
        // to: 我自己，中介公司，卖房人
        _transfer(from, to, amount);
        return true;
    }
    

    // - 5、事件 -
    
    event Transfer(address  from, address to, uint256 amount);
    event Approval(address owner, address spender, uint256 amount);


    // - 6、合约内部函数 - 
    function _mint(address account, uint256 amount) internal {
        require(account != address(0), unicode"ERC20: mint to the ero address");
        // 初始化货币数量
        _totalSupply += amount;
        // 给某个账号注入起始资金
        unchecked {
            _balances[account] += amount;
        }
    }

    function _transfer(address from, address to , uint256 amount)  internal {
        require(from != address(0), unicode"ERC20: transfer from the zero address");
        require(to != address(0), unicode"ERC20: transfer to the zero address");

        uint256 fromBalance = _balances[from];
        
        require(fromBalance >= amount, unicode"ERC20: 余额不足。");
        unchecked {
            _balances[from] = fromBalance - amount;
            _balances[to] += amount;
        }

        emit Transfer(from, to, amount);
    } 

    function _approve(address owner, address spender, uint256 amount) internal  {
        require(owner != address(0), "ERC20: approve from the zero addrss");
        require(spender != address(0), "ERC20: approve from the zero addrss");

        // _allowances
        // 执行授权
        _allowances[owner][spender] = amount;

        emit Approval(owner, spender, amount);


    }   


    function _spendAllowance(address owner, address spender, uint256 amount) internal  {
        uint256 currentAllowance = allowanceOf(owner, spender);

        if (currentAllowance != type(uint256).max) {
            require(currentAllowance >= amount, unicode"ERC20: 余额不足");
            unchecked {
                _approve(owner, spender, currentAllowance - amount);
            }
        }
    }


    /**
        方法
        function name() public view returns (string)
        function symbol() public view returns (string)
        function decimals() public view returns (uint8)
        function totalSupply() public view returns (uint256)
        function balanceOf(address _owner) public view returns (uint256 balance)
        function transfer(address _to, uint256 _value) public returns (bool success)
        function transferFrom(address _from, address _to, uint256 _value) public returns (bool success)
        function approve(address _spender, uint256 _value) public returns (bool success)
        function allowance(address _owner, address _spender) public view returns (uint256 remaining)

        // 事件
        event Transfer(address indexed _from, address indexed _to, uint256 _value)
        event Approval(address indexed _owner, address indexed _spender, uint256 _value)

    */


    /**
        {
            0x5B38Da6a701c568545dCfcB03FcB875f56beddC4: 20000
        }
    */


    /**

        {
            0x5B38Da6a701c568545dCfcB03FcB875f56beddC4: {
                0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2: 30000,
                0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db: 20000
            }
        }
    */

    /**
        {
            0x5B38Da6a701c568545dCfcB03FcB875f56beddC4: 10000 - 100
        }

        {
            0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2: 10000 + 100
        }
    */



    /**
        主体： 借款人， 贷款人， 中介公司， 房屋出售者。 不同的account
        授权： 贷款人（银行）借钱给我。 approve 100w
        提款： 从银行货款账户里提钱给自己。 trandsferFrom(from , to , amount) 1w
        支付房款： 借款人转账给房屋出售者。 transferFrom. 90w
        我要支付佣金： 借款人转账中介公司。  transferFrom 9w
        
    */

    /**
        0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
        0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
        0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db
        0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB
        0x617F2E2fD72FD9D5503197092aC168c91465E7f2


        {
            0x5B38Da6a701c568545dCfcB03FcB875f56beddC4: {
                0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2: 100w
            },
            // [0x5B38Da6a701c568545dCfcB03FcB875f56beddC4][0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2] = 100w
            0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db: {
                0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB: 200w
            }
        }
    */


}

