/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract mainTokenLock at 0x32a9938d567adfed4fde49e8846a86d278f893f0
*/
pragma solidity ^0.4.20;

interface token {
    function transfer(address receiver, uint amount);
}

contract Ownable {
    
  address public owner;


  function Ownable() {
    owner = msg.sender;
  }


  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }


  function transferOwnership(address newOwner) onlyOwner {
    require(newOwner != address(0));      
    owner = newOwner;
  }

}
 contract mainTokenLock is Ownable {
    
  token public tokenLocked;
  
  function retrieveTokens(uint _value) onlyOwner {
    require(_value > 0);
    if (now <= 1537876800)
    revert();
	tokenLocked = token(0xC2eAF62D3DB7c960d8Bb5D2D6a800Dd817C8E596);
    tokenLocked.transfer(owner, _value);
  }
}