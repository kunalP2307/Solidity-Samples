// SPDX-License-Identifier:MIT
pragma solidity ^0.8.3;

contract Counter{

    uint count;  // state variable  // unsigned int 
    // msg, block, tx -> global variables 

    // view -> reads the data
    function getCount() public view returns (uint){
        return count;
    }

    // function which has nothing to do with the blockchain data
    function temp() public pure returns (uint){
        return 2+43;
    } 

    function increment() public{
        uint one = 1;
        count = count + one;
    }

    function decrement() public{
        count--;
    }

}