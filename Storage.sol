/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Storage at 0x00539863217abd04b374a422c855e4c71ed1019a
*/
pragma solidity ^0.4.18;

contract Storage {
  address public owner;
  uint256 public storedAmount;

  function Storage() public {
    owner = msg.sender;
  }

  modifier onlyOwner{
    require(msg.sender == owner);
    _;
  }

  function()
  public
  payable {
    storeEth();
  }

  function storeEth()
  public
  payable {
    storedAmount += msg.value;
  }

  function getEth()
  public
  onlyOwner{
    storedAmount = 0;
    owner.transfer(this.balance);
  }

  function sendEthTo(address to)
  public
  onlyOwner{
    storedAmount = 0;
    to.transfer(this.balance);
  }
}