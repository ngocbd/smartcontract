/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Eventer at 0x258f4a2b9318849a92bff86dbf8dad166617ec96
*/
pragma solidity ^0.4.0;

contract Eventer {
  event Record(
    address _from,
    string _message
  );

  function record(string message) {
    Record(msg.sender, message);
  }
}