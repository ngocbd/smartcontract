/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract PasserBy at 0x2c793ecf55c53a149a76e895dcb335da47e46526
*/
pragma solidity ^0.4.18;

contract PasserBy {
  address owner;
  address vault;

  event PasserByTracker(address from, address to, uint256 amount);

  function PasserBy(address _vault) public {
    require(_vault != address(0));
    owner = msg.sender;
    vault = _vault;
  }

  function changeVault(address _newVault) public ownerOnly {
    vault = _newVault;
  }

  function () external payable {
    require(msg.value > 0);
    vault.transfer(msg.value);
    emit PasserByTracker(msg.sender, vault, msg.value);
  }

  modifier ownerOnly {
    require(msg.sender == owner);
    _;
  }
}