/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract PLATPriceOracle at 0x991d6ffaf07b6063ea863e0c4eabe312fc309b17
*/
pragma solidity ^0.4.20;

contract PLATPriceOracle {

  mapping (address => bool) admins;

  // How much PLAT you get for 1 ETH, multiplied by 10^18
  uint256 public ETHPrice = 600000000000000000000000;

  event PriceChanged(uint256 newPrice);

  constructor() public {
    admins[msg.sender] = true;
  }

  function updatePrice(uint256 _newPrice) public {
    require(_newPrice > 0);
    require(admins[msg.sender] == true);
    ETHPrice = _newPrice;
    emit PriceChanged(_newPrice);
  }

  function setAdmin(address _newAdmin, bool _value) public {
    require(admins[msg.sender] == true);
    admins[_newAdmin] = _value;
  }
}