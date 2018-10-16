/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Migrations at 0x44b39f1deda0eda71271075f3f75ff1f5735b4fe
*/
pragma solidity ^0.4.17;

contract Migrations {

  address public owner;
  uint256 public lastCompletedMigration;

  function Migrations() public {
    owner = msg.sender;
  }

  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  function setCompleted(uint256 completed) external onlyOwner {
    lastCompletedMigration = completed;
  }

  function upgrade(address newAddress) external onlyOwner {
    Migrations upgraded = Migrations(newAddress);
    upgraded.setCompleted(lastCompletedMigration);
  }
}