// SPDX-License-Identifier:MIT
pragma solidity 0.8.7;

contract Mofider{
    
    int private num;

    //intercepter // before calling function 
    modifier check(int temp) {
        if(temp > 5)
            _;
    }

    function updateNum(int temp) public check(temp){
        num += temp;
    }

    function getNum() public view returns(int){
        return num;
    }
}