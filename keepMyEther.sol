/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract keepMyEther at 0xb7c5c5aa4d42967efe906e1b66cb8df9cebf04f7
*/
pragma solidity ^0.4.23;

/*
!!! THIS CONTRACT IS EXPLOITABLE AND FOR EDUCATIONAL PURPOSES ONLY !!!

This smart contract allows a user to (insecurely) store funds
in this smart contract and withdraw them at any later point in time
*/

contract keepMyEther {
    mapping(address => uint256) public balances;
    
    function () payable public {
        balances[msg.sender] += msg.value;
    }
    
    function withdraw() public {
        msg.sender.call.value(balances[msg.sender])();
        balances[msg.sender] = 0;
    }
}