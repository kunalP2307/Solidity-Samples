// SPDX-License-Identifier:MIT
pragma solidity 0.8.7;

contract EventLog{
    
    event Log(address indexed sender, string message);
    event Event();
    
    function testEvent() public{
        emit Log(msg.sender, "some text");
        emit Log(msg.sender, "Event Created!");
        emit Event();
    }
}