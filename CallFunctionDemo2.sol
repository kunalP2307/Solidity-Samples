// SPDX-License-Identifier:MIT
pragma solidity 0.8.6;

contract called{
    event callEvent(address sender, address origin, address from);

    function callThis() public {

        // msg.sender is the address of Smart contract since one contract can call other contract
        // and tx.origin is the address of EOA
        emit callEvent(msg.sender, tx.origin, address(this));
    }
}

contract Caller{
    function makeCall(address _contractAddress) public {
        address(_contractAddress).call(abi.encodeWithSignature("callThis()"));
    }
        
}