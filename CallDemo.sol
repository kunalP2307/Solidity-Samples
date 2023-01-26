// SPDX-License-Identifier:MIT
pragma solidity 0.8.6;

contract CallDemo{

    string public str = "Something";

    // if particular ether is sent in msg.value, then update the string
    function updateString(string memory _newString) public payable returns(uint,uint){
        uint startGas = gasleft();
        require(msg.value == 1 ether);
        str = _newString;
        address payable owner = payable(msg.sender);

        (bool sucess,) = owner.call{value : msg.value}("");
        require(sucess, "failre");
        return (startGas, startGas - gasleft());
    }
}


// optimization we can make optimization by  