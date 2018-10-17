/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Uturn at 0xb61adb48b05cc3c22d364dc119ebbf41cc5b9d49
*/
pragma solidity ^0.4.22;

contract Uturn {
    function() public payable {
        msg.sender.transfer(msg.value);
    }
}