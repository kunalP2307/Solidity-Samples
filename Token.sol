// SPDX-License-Identifier:MIT
pragma solidity 0.8.7;

contract Token{
    
    string public name = "kunal";
    string public symbol = "symbol";

    uint public totalSupply = 1000;
    
    address public owner;
    mapping(address => uint) balance;

    constructor(){
        owner = msg.sender;
        balance[owner] = totalSupply;
    }

    function transfer(address _to, uint ammount) external{
        balance[msg.sender] -= ammount;
        balance[_to] += ammount;
    }

    function getBalance(address _of) public view returns (uint){
        return balance[_of];
    }

}