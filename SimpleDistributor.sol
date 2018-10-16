/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract SimpleDistributor at 0xde08a96e974bad18f64013d5b59b3c8e3f4621f8
*/
pragma solidity ^0.4.20;

contract Mintable {
    
  function mint(address _to, uint256 _amount) public returns (bool);
  
  function transfer(address to, uint256 value) public returns (bool);
  
}


contract SimpleDistributor {
    
  address public owner;
    
  Mintable public token = Mintable(0x552Ed8253f341fb770E8BAdff5A0E0Ee2fd57B43);
    
  function SimpleDistributor() public {
    owner = msg.sender;
  }
   
  function addReceivers(address[] receivers, uint[] balances) public {
    require(msg.sender == owner);
    for(uint i = 0; i < receivers.length; i++) {
      token.mint(this, balances[i]);  
      token.transfer(receivers[i], balances[i]);
    }
  } 
  
}