// SPDX-License-Identifier:MIT
pragma solidity 0.8.7;

contract A{

    function something() external pure{
        revert();
    }
}

contract B{
    A a = new A();
    string public status = "NA";


    function somethingB() public{
        
        try a.something() {
            status = "success";
        }
        catch {
            status = "failed";
        }
        
    }
}