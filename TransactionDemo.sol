// SPDX-License-Identifier:MIT
pragma solidity 0.8.7;

contract Transfer{
    
    address public senderAddress;
    uint public balance;

    function setter() public{
        senderAddress = msg.sender;
        balance = msg.sender.balance;
    }

    function transfer(address payable to) public payable{
        to.transfer(msg.value);
    }
}