/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Switch at 0x69644dad199c1973ae660ddbd86bfec1109c06a7
*/
pragma solidity ^0.4.8;
contract Switch 
{
    uint256 public blink_block;
    uint256 public on_block;
    address public owner;

    function Switch(){
        owner=msg.sender;
        on_block=block.number;
        blink_block=block.number;
    }
    function blink() payable {
        if(msg.value>0)blink_block=block.number;
    }
    function () payable {
        if(msg.value>0)on_block=block.number;
    }
    function kill() {
    if (msg.sender==owner) selfdestruct(owner);
    }
}