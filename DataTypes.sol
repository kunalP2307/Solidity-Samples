// SPDX-License-Identifier:MIT
pragma solidity 0.8.6;

contract DataTypes{
    bool public b = true;
    uint8 public ui8 = 8;
    int public i8 = -2;
    
    int public minInt = type(int).min;
    int public maxInt = type(int).max;
    address public addr = 0x7ae71b5321BB7D7c7866f99B19aE604A05962a9E;
    // address only allows valid addresses to store
    // lenght -> 20bytes or 160 bits
    
}