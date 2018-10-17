/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Migrations at 0x9ac84c3232a5c46643b28a78274bb8dd2da37df4
*/
pragma solidity ^0.4.4;

contract Migrations {
  address public owner;
  uint public last_completed_migration;

  modifier restricted() {
    if (msg.sender == owner) _;
  }

  constructor() public{
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