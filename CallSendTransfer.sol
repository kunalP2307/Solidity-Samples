// SPDX-License-Identifier:MIT
pragma solidity 0.8.7;

contract CallSendTransfer{

    function sendUsingTransfer(address payable _to) public payable{
    
        _to.transfer(msg.value);  // 2300 gas limit
    }

    function sendUsingSend(address payable _to) public payable{

        bool success = _to.send(msg.value); // 2300 gas limit
        require(success,"failed to transfer ether");
    }

    function sendUsingCall(address payable _to) public payable{
        
        // recommended function
        (bool success,) = _to.call{value : msg.value,
                                     gas : 10000}("");
        require(success,"failed to transfer ether");

    }

}