/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Counter at 0x67001700b122b44012de9cf7d7fa3338fe9265b3
*/
pragma solidity ^0.4.8;
contract Counter {
  uint i=1;
  function inc() {
    i=i+1;
  }
  function get() constant returns (uint) {
    return i;
  }
}