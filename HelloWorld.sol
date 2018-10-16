/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract HelloWorld at 0xc4c89dd46524c6f704e92a9cd012a3ebadadff36
*/
pragma solidity ^0.4.0;

contract HelloWorld {
    address public owner;
    
    modifier onlyOwner() { require(msg.sender == owner); _; }
    
    constructor() public {
        owner = msg.sender;
    }
    
    function salutaAndonio() public pure returns(bytes32 hw) {
        hw = "HelloWorld";
    }
    
    function killMe() public onlyOwner {
        selfdestruct(owner);
    }
    
}