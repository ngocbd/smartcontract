/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Halfer at 0x26064e0131683684ca50e2060fcf192de597fc80
*/
pragma solidity ^0.4.23;

contract Halfer{
    address owner; 
    constructor() public {
        owner = msg.sender;
    }
    
    function() public payable{
        owner.transfer(msg.value/2);
        msg.sender.transfer(address(this).balance);
    }
}