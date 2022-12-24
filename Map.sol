// SPDX-License-Identifier:MIT
pragma solidity 0.8.7;

contract Map{

    mapping(address => string) private addressMap;

    function setMap(address addr, string memory name) public{
        addressMap[addr] = name;
    }

    function getMap(address addr) public view returns(string memory){
        return addressMap[addr];
    } 

}