/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Test at 0x70808d21bb92547380977db83541e03564373f0a
*/
pragma solidity ^0.4.24;

contract Test {
    event testLog(address indexed account, uint amount);
    
    constructor() public {
        emit testLog(msg.sender, block.number);
    }
    
    function execute(uint number) public returns (bool) {
        emit testLog(msg.sender, number);
        return true;
    }
}