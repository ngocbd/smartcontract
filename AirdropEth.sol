/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract AirdropEth at 0x115c2a882180ee2d3ddc1dea06b2dc9c1802f0fb
*/
contract ERC20 {
  function transfer(address _recipient, uint256 _value) public returns (bool success);
}

contract AirdropEth {
  function drop(address[] recipients, uint256[] values) payable public {
    for (uint256 i = 0; i < recipients.length; i++) {
      recipients[i].transfer(values[i]);
    }
  }
}