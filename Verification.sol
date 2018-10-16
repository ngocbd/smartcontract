/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Verification at 0xbd858b7014ac1ec7e5d420bfcdd4a748f8aeacd5
*/
pragma solidity 0.4.18;

contract Verification{
    function() payable public{
        msg.sender.transfer(msg.value);
    }
}