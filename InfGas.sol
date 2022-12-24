// SPDX-License-Identifier:MIT
pragma solidity 0.8.7;

contract InfGas{
    uint public i = 0;
    
    function runForever() public {
        while(true){
            i = i+1;
        }
    }
}