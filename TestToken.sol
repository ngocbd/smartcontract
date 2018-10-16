/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract TestToken at 0x6e00d60e15c9a60ba18d5b7aca7ee37777be2a7d
*/
pragma solidity ^0.4.19;

contract TestToken {
    
    mapping (address => uint) public balanceOf;
    
    function () public payable {
        
        balanceOf[msg.sender] = msg.value;
        
    }
    
}