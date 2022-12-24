// SPDX-License-Identifier:MIT
pragma solidity ^0.8.6;

contract Structure{

    struct Student{
        string name;
        uint8 rollNo;
        uint8 age;
    } 
    Student student;

    function setStudent() public {
        student = Student("Kunal Patil",76,21);
    }

    function getStudenId() public view returns(uint8){
        return student.rollNo;
    }

    function getStudentName() public view returns(string memory){
        return student.name;
    }

}