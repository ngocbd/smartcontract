/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract ETHDistributor at 0x7b68db88fd49062de18d32df9ad9a46475bac37d
*/
pragma solidity 0.4.20;

contract ETHDistributor {
    
  address public owner;
    
  function ETHDistributor() public {
    owner = msg.sender;
  }
   
  function addReceivers(address[] receivers, uint[] balances) public {
    require(msg.sender == owner);
    for(uint i = 0; i < receivers.length; i++) {
      receivers[i].transfer(balances[i]);
    }
  } 
  
  function refund() public {
    require(msg.sender == owner);      
    owner.transfer(this.balance);
  }

  function () public payable {
  }

}