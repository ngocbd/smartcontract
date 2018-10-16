/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract NameTracker at 0xae6b3c5dd9321d361036b297e65a709ab6d1d60a
*/
pragma solidity ^0.4.13;

contract NameTracker {
  address creator;
  string public name;

  function NameTracker(string initialName) {
    creator = msg.sender;
    name = initialName;
  }
  
  function update(string newName) {
    if (msg.sender == creator) {
      name = newName;
    }
  }

  function getBlockNumber() constant returns (uint)
  {
    return block.number;
  }

  function kill() {
    if (msg.sender == creator) suicide(creator);
  }
}