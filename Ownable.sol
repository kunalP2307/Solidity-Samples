// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyOwnable is Ownable{
    
    function normalFunction() external pure returns(string memory){
        return "Anyone Can access it";
    }

    function ownerFunction() external view onlyOwner returns(string memory){
        return "Only Owner can access this function";
    }
}