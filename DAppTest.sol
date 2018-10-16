/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract DAppTest at 0x70a9c7a1977792fa4eb7f89ecfc02d3d14dba054
*/
pragma solidity ^0.4.18;

contract DAppTest {

  bool public _is;

  function changeBoolean() public returns (bool success) {
    _is = !_is;
    return true;
  }

}