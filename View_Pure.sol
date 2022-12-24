// SPDX-License-Identifier:MIT
pragma solidity 0.8.7;


//  View Functions declares that no state will be changed
//  Pure function declares that no state will be changed or accesed
//  Abstraction

contract ViewPure{
    uint public x = 1;
    function addVirtual(uint y) public view returns(uint){
        
        /*
            invalid 
            x = x + 4;
        */
        // able to read x 

        return x+y;
    }

    // deal with local variables only
    // nothing to do with the state variables
    function addPure(uint n1,uint n2) public pure returns(uint){
        
        /* 
            not allowed
            return x+y;
        */

        return n1+n2;
    }

}