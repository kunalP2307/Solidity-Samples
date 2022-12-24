// SPDX-License-Identifier:MIT
pragma solidity ^0.8.6;

contract enum1{

    enum FreshJuice{small,medium,large} FreshJuice choice;
    FreshJuice constant defaultChoice = FreshJuice.small;

    function setToLarge() public {
        choice = FreshJuice.large;
    }

    function getChoice() public view returns(FreshJuice){
        return choice;
    }

    function getDefaultChoice() public pure returns(uint){
        return uint(defaultChoice);
    }

}