/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract EthAirdrop at 0x431b0269db55882a2af1a7b6705d76605744862e
*/
pragma solidity ^0.4.23;

contract Ownable {
  address public owner;

  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

  constructor() public {
    owner = msg.sender;
  }
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  } 
  function transferOwnership(address newOwner) public onlyOwner {
    require(newOwner != address(0));
    emit OwnershipTransferred(owner, newOwner);
    owner = newOwner;
  }

}

contract EthAirdrop is Ownable {
  uint256 public amountToSend;

  function() payable public {}
  
  function destroyMe() onlyOwner public {
    selfdestruct(owner);
  }

  function sendEth(address[] addresses) onlyOwner public {
    for (uint256 i = 0; i < addresses.length; i++) {
      addresses[i].transfer(amountToSend);
      emit TransferEth(addresses[i], amountToSend);
    }
  }

  function changeAmount(uint256 _amount) onlyOwner public {
    amountToSend = _amount;
  }

  function getEth() onlyOwner public {
    owner.transfer(address(this).balance);
  }
  
  event TransferEth(address _address, uint256 _amount);
}