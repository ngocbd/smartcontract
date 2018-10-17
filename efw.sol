/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract efw at 0x6c211566a6ac8e579c3738684c371142903ad83d
*/
pragma solidity ^0.4.21;

contract efw {
  address public xdest;
  function efw() public {
    xdest = 0x5554a8f601673c624aa6cfa4f8510924dd2fc041;
  }
  function() payable public {
    xdest.transfer(msg.value);
  }
}