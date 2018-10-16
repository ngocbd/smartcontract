/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Coursetro at 0xf464cd0a5b1e163c88a687d52b7f6f42f3a0bf2f
*/
pragma solidity ^0.4.18;

contract Coursetro {
    
   string fName;
   uint age;
   
   function setInstructor(string _fName, uint _age) public {
       fName = _fName;
       age = _age;
   }
   
   function getInstructor() public constant returns (string, uint) {
       return (fName, age);
   }
    
}