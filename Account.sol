// SPDX-License-Identifier:MIT
pragma solidity 0.8.7;

contract Account{

    mapping(address => uint) balAccMap;
    // address of contract deployer

    address public owner;

    constructor(){
        owner = msg.sender;
    }

    function addBalance(uint ammount) public {
        
        // when input is comming from outside use require or revert()
        // it will refund the gas remaining
        require(msg.sender == owner, "You don't have previllages");
        
        // use assert for internal checking
        // may not revert the remaining gas
        uint a = 12;
        uint b = 2;
        uint c = a + a;
    
        assert(c == 14);
        
        balAccMap[msg.sender] += ammount;
    } 

    function getBalance() public view returns(uint){

        return balAccMap[msg.sender];
    }

    function transfer(address to, uint ammount) public{
        
        // revert is used to rollback the transaction or whatever changed made to state variable

        // if(balAccMap[msg.sender] < ammount)
        //     revert("Insufficent Funds");

        // if the condition is false throw error / revert the transaction
        require(balAccMap[msg.sender] > ammount, "Insufficent Balance");

        balAccMap[msg.sender] -= ammount;
        balAccMap[to] += ammount;
    }

}