/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract blockHashNotReturned at 0x92900a372ed0f0921a08ea9df158c0aac34e4e0c
*/
pragma solidity ^0.4.24;

contract blockHashNotReturned {
    function currentBlockHash() public returns (bytes32 b) {
        return blockhash(block.number); 
    }
    function currentBlockHashCst() constant public returns (bytes32 b) {
        return blockhash(block.number); 
    }
}