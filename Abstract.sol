// SPDX-License-Identifier:MIT
pragma solidity 0.8.7;


abstract contract Animal{

    function speak() public virtual returns(string memory);

}

interface AnimalTemplate{
    function speak() external returns(string memory);
}

contract Dog is Animal{
    function speak() public pure override returns(string memory){
        return "Barking!!";
    }
}


contract RecieveDemo{

    string public called = "";
    uint public ammount = 0;
    bytes public data;

    receive() external payable{
        called = "recieve";
        ammount = msg.value;
    }
    
    fallback() external payable {
        called = "recieve";
        ammount = msg.value;
        data = msg.data;
    }
}