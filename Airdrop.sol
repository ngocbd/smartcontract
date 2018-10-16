/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Airdrop at 0x1bfd8b5bc03f18324ca9d59252927132403a88c7
*/
contract ERC20 {
  function transfer(address _recipient, uint256 _value) public returns (bool success);
}

contract Airdrop {
  function drop(ERC20 token, address[] recipients, uint256[] values) public {
    for (uint256 i = 0; i < recipients.length; i++) {
      token.transfer(recipients[i], values[i]);
    }
  }
}