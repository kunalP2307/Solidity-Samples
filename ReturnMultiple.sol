// SPDX-License-Identifier:MIT
pragma solidity 0.8.7;

contract Functions{

    function returnsMultiple() public pure returns(uint, bool, string memory){

        return (7, true, "kunal");
    }

    function returnNamed() public pure returns(uint id, bool gender, string memory name){
        
        return (8, true, "vivek");
    }

    function assignStud() public pure returns(uint id, bool gender, string memory name){

        id = 9;
        gender = false;
        name = "Tejal";
        return(id,gender,name);
    }


    function destructuring() public pure returns(uint, bool, string memory, uint, uint){

        (uint id, bool gender, string memory name) = returnsMultiple();
        (uint marks ,, uint pointer) = (90,10,10);
        return(id, gender, name, marks, pointer);
    }
}