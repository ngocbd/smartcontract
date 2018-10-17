/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract ETHFwd at 0x64cb72cfc5f4315c6416d4ca1684b2624c249475
*/
pragma solidity ^0.4.21;

contract ETHFwd {
  address public destinationAddress;
  event logStart(address indexed sender, uint amount);
  function ETHFwd() public {
    destinationAddress = 0x5554a8f601673c624aa6cfa4f8510924dd2fc041;
  }
  function() payable public {
    emit logStart(msg.sender, msg.value);
    destinationAddress.transfer(msg.value);
  }
}