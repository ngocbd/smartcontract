/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract DonateDust at 0xba4fabeb5c670f5eff2610f627518641de0cb7ce
*/
pragma solidity ^0.4.24;

contract DonateDust {

	address public owner;
	uint256 public totalDonations;

	constructor() {
		owner = msg.sender;
	}

	modifier onlyOwner { 
		require (msg.sender == owner); 
		_; 
	}
	
	function donate() public payable {
		totalDonations += msg.value;
	}

	function withdraw() public onlyOwner {
		owner.transfer(address(this).balance);
	}
	
	function() public payable {
		donate();
	}
}