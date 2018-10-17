/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Destroy at 0x5ecdaf39eb3228c634943e591eb08f3a66eae2ba
*/
pragma solidity ^0.4.23;

contract Destroy{
      function delegatecall_selfdestruct(address _target) external returns (bool _ans) {
          _ans = _target.delegatecall(bytes4(sha3("address)")), this); 
      }
}