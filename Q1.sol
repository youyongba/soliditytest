// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.9;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Q1 is ERC20 {
    constructor(address recipient) ERC20("q1", "q1") {
        _mint(recipient, 100000000 * 10 ** decimals());
    }
}

