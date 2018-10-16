/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Counter at 0xd3f9db6a2ebb18617a2e279b07887e4c6f35b5f1
*/
pragma solidity ^0.4.0;
contract Counter {
    
    uint total;
  
    function add(uint num) public {
        total = total + num;
    }
    
    function subtract(uint num) public {
        total = total - num;
    }
    
    function double() public {
        total = total * 2;
    }
  
}