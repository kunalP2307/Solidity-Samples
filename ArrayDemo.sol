// SPDX-License-Identifier:MIT
pragma solidity ^0.8.6;

contract ArrayDemo{
    uint[] array = [34,3,122]; 
    //uint[4] public fixArray;

    function getArray() public view returns (uint[] memory){
        return array;
    }

    function getLength() public view returns(uint){
        return array.length;
    }

    function addElement(uint ele) public{
        array.push(ele);
    }

    // function popElement() public{
    //     array.pop();
    // } 

    function removeAtIndex(uint index) public{
        //won't shift the elements replaces with 0
        //shifting becomes computational heavy
        delete array[index];
        for(uint i=index+1; i<array.length; i++)
            array[i-1] = array[i];
        
        array.pop();
    }

    // farray.delete(index);unction getFixArray() public view returns (uint[4] memory){
    //     return fixArray;
    // }
}