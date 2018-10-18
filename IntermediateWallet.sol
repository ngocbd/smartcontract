/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract IntermediateWallet at 0x61a61b4c1c47675d6465e1853dad7cfb02f855d3
*/
pragma solidity ^0.4.24;

contract ERC20BasicCutted {
  function balanceOf(address who) public view returns (uint256);
  function transfer(address to, uint256 value) public returns (bool);
}

contract IntermediateWallet {
    
  address public wallet =0x0B18Ed2b002458e297ed1722bc5599E98AcEF9a5;

  function () payable public {
    wallet.transfer(msg.value);
  }
  
  function tokenFallback(address _from, uint _value) public {
    ERC20BasicCutted(msg.sender).transfer(wallet, _value);
  }

}