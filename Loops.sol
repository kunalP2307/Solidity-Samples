// SPDX-License-Identifier:MIT
pragma solidity 0.8.7;

contract Loop{
    // solidity does not allow print statements

    uint[] array;
    uint8 i = 0;
    
    function iterateArray() public returns(uint[] memory){

        while(i<10){
            array.push(i*10);
            i++;
        }
        return array;
    }

    
}