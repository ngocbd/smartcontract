/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract dubbel at 0xb2d80b0f2fbd94d475a6ed13cd650aa7b69cafc7
*/
pragma solidity ^0.4.20;

contract dubbel {
    address public previousSender;
    uint public price = 0.001 ether;
    
    function() public payable {
            require(msg.value == price);
            previousSender.transfer(msg.value);
            price *= 2;
            previousSender = msg.sender;
    }
}