/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Airdrop at 0x5b919f09e295f5ec441ac21607a0b142a7fb09ac
*/
pragma solidity ^0.4.23;

interface TokenContract {
  function transfer(address _to, uint256 _value) external returns (bool);
}

contract Airdrop {
  address public owner;
  bool public isTheContract = true;

  constructor() public {
  
    owner = msg.sender;
  }

  function sendTokens(address[] addresses, uint256[] _amount, address _tokenAddress) public {
    //require(msg.sender == owner);
    uint256 addressCount = addresses.length;
    uint256 amountCount = _amount.length;
    require(addressCount == amountCount);
    TokenContract tkn = TokenContract(_tokenAddress);
    for (uint256 i = 0; i < addressCount; i++) {
      tkn.transfer(addresses[i], _amount[i]);
    }
  }

  function destroyMe() public {
    require(msg.sender == owner);
    selfdestruct(owner);
  }
    
}