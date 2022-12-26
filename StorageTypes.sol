// SPDX-License-Identifier:MIT
pragma solidity 0.8.7;

contract DataStorage{
    // default type for state variables is Storage
    string name = "Kunal";
    string newVar2 = "fd";
    string newVar3 = "rere";
    string newVar4 = "334545";
    string newVar5 = "r3434";
        
    // callData : if value of parameters is not going to change i.e non modifiable
    // memory : can change the value of parameters

    function showName() public view returns(string memory){
        string storage newVar;
        string storage newVar2;
        string storage newVar3;
        string storage newVar4;
        string storage newVar5;
        
        return name;
    }

    function resultMemory(string memory s) public pure returns (string memory){
        s = "fksjhsdk";
        return s;
    }  

    function resultCallData(string calldata s) public pure returns (string calldata){
        // can't update variable
        // s = "43435";
        return s;
    }  
}