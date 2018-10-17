/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract VpaxContract at 0xbdfaba9c556c42016d2129e09bef2d1cd947b958
*/
pragma solidity ^0.4.18;

contract VpaxContract {

  function VpaxContract(){}

  function transferCoins(address receiver) payable public {
    require(receiver != 0X0);
    require(msg.sender != receiver);
    require(msg.value > 0);
    receiver.transfer(msg.value);
  }
}