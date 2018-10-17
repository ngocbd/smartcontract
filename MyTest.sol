/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract MyTest at 0x6541242ff558fde0c9810c8f4e4506a3a7ff740d
*/
pragma solidity ^0.4.23;

contract MyTest{
    string private name;
   
    function setName(string newName) public{
        name=newName;
    }
    
    function getName() public view returns(string){
        return name;
    }
    
}