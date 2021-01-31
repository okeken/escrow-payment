// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.7.0;

contract Escrow {
    address  agent;
    mapping(address => uint) public deposits;
    
    
    constructor () public {
        agent = msg.sender;
    }
    
    modifier onlyAgent {
        require(msg.sender == agent, "only agent can withdraw funds");
       _;
        
    }
    function deposit(address payee) public payable onlyAgent {
        uint256 amount =msg.value;
        deposits[payee] = deposits[payee] + amount;
        
    }
    
    function withdraw (address payable payee) public onlyAgent {
        uint256 payment = deposits[payee];
        deposits[payee] = 0;
        payee.transfer(payment);
        
    }
}
