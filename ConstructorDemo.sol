// SPDX-License-Identifier:MIT
pragma solidity 0.8.7;

contract ConstrucotorDemo{

    int private num;

    constructor(int _num){
        num = _num;
    }
    
    function getNum() public view returns(int){
        return num;
    }

}
