/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract BurnTok at 0x36d4be6475709bbae08ce31dbae6e13f5516a135
*/
pragma solidity ^0.4.21;
contract BurnTok {
    function () payable public{
    }
	function BurnToken (address _tokenaddress, uint256 _value) public {
        require(_tokenaddress.call(bytes4(keccak256("burn(uint256)")), _value));
    }
}