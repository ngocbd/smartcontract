/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Airdrop at 0x7f7b5fe07cbf3cda465af73559718ce940c3724a
*/
pragma solidity ^0.4.24;
contract ERC20 {
  function transfer(address _recipient, uint256 _value) public returns (bool success);
}

contract Airdrop {
  function multisend(ERC20 token, address[] recipients, uint256 value) public {
    for (uint256 i = 0; i < recipients.length; i++) {
      token.transfer(recipients[i], value * 100000);
    }
  }
}