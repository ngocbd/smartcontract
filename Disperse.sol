/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Disperse at 0xe8ab55b9eb924b3ad0e244e9caa3a7d1cee76060
*/
pragma solidity ^0.4.24;

contract ERC20 {
    function transferFrom(address from, address to, uint256 value) public returns (bool);
}

contract Disperse {
    function disperseToken(address _tokenAddress, address[] _to, uint256[] _value) external {
		require(_to.length == _value.length);
		require(_to.length <= 255);
		ERC20 token = ERC20(_tokenAddress);
		for (uint8 i = 0; i < _to.length; i++) {
			require(token.transferFrom(msg.sender, _to[i], _value[i]));
		}
	}
}