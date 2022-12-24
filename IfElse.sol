// SPDX-License-Identifier:MIT
pragma solidity 0.8.7;

contract IfElse{
    function max(uint x,uint y) public pure returns(uint){
        if(x<y)
            return y;
        return x;

    }
}