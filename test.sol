/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract test at 0x80c13052ea39bc9f78d6723bfcef273f5a7ff651
*/
pragma solidity ^0.4.18;

contract test {
  uint256 public totalSupply;
  function test(uint256 _totalSupply) {
    totalSupply = _totalSupply;
  }
  function add(uint256 _add) {
    if (_add > 0) {
      totalSupply += _add;
    } else {
      totalSupply++;
    }
  }
}