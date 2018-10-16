/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Migrations at 0xdbca69e2e39e40af8b6c0e719a3c50b2e465fd32
*/
pragma solidity ^0.4.4;

// File: contracts/Migrations.sol

contract Migrations {
  address public owner;
  uint public last_completed_migration;

  modifier restricted() {
    if (msg.sender == owner) _;
  }

  function Migrations() public {
    owner = msg.sender;
  }

  function setCompleted(uint completed) restricted public {
    last_completed_migration = completed;
  }

  function upgrade(address new_address) restricted public {
    Migrations upgraded = Migrations(new_address);
    upgraded.setCompleted(last_completed_migration);
  }
}