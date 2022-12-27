// SPDX-License-Identifier:MIT
pragma solidity 0.8.7;

contract Payable{

    // payable address can send or recieve ether
    address payable public owner;

    // payable contructor can recieve ether
    constructor() payable{
        owner = payable(msg.sender);
    }

    // payable function can recieve ether
    function deposit() public payable{
        
    }

    // withdraw complete balance from account
    
    function withdraw() public{
    
        uint ammount = address(this).balance;
        (bool succes,) = owner.call{value: ammount}("withdraw from smart contract");

        require(succes,"Failed to withdraw.!");
    }

    function transfer(address payable _to,uint _ammount) public{
        
        (bool succes,) = _to.call{value: _ammount}("ether transfer");
        require(succes ,"failed to transfer ether");
    }   

    function nonPayable() public{

    }   


}