/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract DappTutorial at 0xbe16ba60960a5e92bc878814dddc736252db8f32
*/
pragma solidity ^0.4.13;

contract DappTutorial {
  uint storedData;

  function set(uint x) {
    storedData = x;
  }

  function get() constant returns (uint) {
    return storedData * 2;
  }
}