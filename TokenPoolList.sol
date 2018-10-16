/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract TokenPoolList at 0xd6e8b5746f543712514d56d1ea9e2a8ba5b5e8d3
*/
pragma solidity ^0.4.10;

contract TokenPoolList {
  address[] public list;

  event Added(address x);

  function add(address x) {
    list.push(x);
    Added(x);
  }

  function getCount() public constant returns(uint) {
    return list.length;
  }

  function getAddress(uint index) public constant returns(address) {
    return list[index];
  }
}