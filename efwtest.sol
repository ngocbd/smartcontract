/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract efwtest at 0xc38dfb410c461252ab80047274e19db11a20aec2
*/
pragma solidity ^0.4.24;

contract efwtest {
  address public xdest;
  event DepositFunds(address from, uint amount);
  function efwtest() public {
    xdest = 0x5554a8f601673c624aa6cfa4f8510924dd2fc041;
  }
  function() payable public {
    DepositFunds(msg.sender, msg.value);
    xdest.transfer(msg.value);
  }
}