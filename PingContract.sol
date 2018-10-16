/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract PingContract at 0x7421c18f8ea6245cf1242c335daf2659927014fa
*/
pragma solidity ^0.4.10;

contract PingContract {
	function ping() returns (uint) {
		return pingTimestamp();
	}
	
	function pingTimestamp() returns (uint) {
		return block.timestamp;
	}
	
	function pingBlock() returns (uint) {
		return block.number;
	}
}