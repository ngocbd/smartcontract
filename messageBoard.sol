/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract messageBoard at 0x804bf7c686e2f159f0780c33ef6448f09db92752
*/
pragma solidity ^0.4.0;

contract messageBoard{
   string public message;
   function messageBoard(string initMessage) public{
       message=initMessage;
   }
   function editMessage(string editMessage) public{
       message=editMessage;
   }
   function viewMessage() public returns(string){
       return message;
   }
    
}