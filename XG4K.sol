/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract XG4K at 0x376206e05b41c386a5e4aa9061e7e2d8d41ed073
*/
pragma solidity ^0.4.4;
/* This currency XG4K/ETH can only be issued by the coiner Xgains4keeps owner of 
the Equity4keeps programme and can be transferred to anyone or entity.
*/
contract XG4K {	
	mapping (address => uint) public balances;
	function XG4K() {
		balances[tx.origin] = 100000;
	}
	function sendToken(address receiver, uint amount) returns(bool successful){
		if (balances[msg.sender] < amount) return false;
 		balances[msg.sender] -= amount;
 		balances[receiver] += amount;
 		return false;
 	}
} 
contract coinSpawn{
 	mapping(uint => XG4K) deployedContracts;
	uint numContracts;
	function createCoin() returns(address a){
		deployedContracts[numContracts] = new XG4K();
		numContracts++;
		return deployedContracts[numContracts];
	}
}