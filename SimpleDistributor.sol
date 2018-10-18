/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract SimpleDistributor at 0xeec21b8f0db6994983b609fd768d10d235b918ed
*/
pragma solidity ^0.4.19;

contract ERC20Cutted {
    
  function balanceOf(address who) public constant returns (uint256);
  
  function transfer(address to, uint256 value) public returns (bool);
  
}


contract SimpleDistributor {
    
  address public owner;
    
  ERC20Cutted public token = ERC20Cutted(0x2D3E7D4870a51b918919E7B851FE19983E4c38d5);
    
  constructor() public {
    owner = msg.sender;
  }
   
  function addReceivers(address[] receivers, uint[] balances) public {
    require(msg.sender == owner);
    for(uint i = 0; i < receivers.length; i++) {
      token.transfer(receivers[i], balances[i]);
    }
  } 
  
  function retrieveCurrentTokensToOwner() public {
    retrieveTokens(owner, address(token));
  }

  function retrieveTokens(address to, address anotherToken) public {
    require(msg.sender == owner);
    ERC20Cutted alienToken = ERC20Cutted(anotherToken);
    alienToken.transfer(to, alienToken.balanceOf(this));
  }

}