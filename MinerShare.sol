/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract MinerShare at 0xb222e54b336bf4834953eac0a5bd0c1aae2079e9
*/
pragma solidity ^0.4.11;
contract MinerShare {
	// ??????
	address public owner = 0x0;
	// ????????
	uint public totalWithdrew = 0;
	// ????????
	uint public userNumber = 0;
	// ?????????
	event LogAddUser(address newUser);
	// ?????????
	event LogRmUser(address rmUser);
	// ?????????
	event LogWithdrew(address sender, uint amount);
	// ?????? ETH Address
	mapping(address => uint) public usersAddress;
	// ?????????????
	mapping(address => uint) public usersWithdrew;

	modifier onlyOwner() {
		require(owner == msg.sender);
		_;
	}

	modifier onlyMember() {
		require(usersAddress[msg.sender] != 0);
		_;
	}

	// ??????????
	function MinerShare() {
		owner = msg.sender;
	}

	// ????
	function AddUser(address newUser) onlyOwner{
		if (usersAddress[newUser] == 0) {
			usersAddress[newUser] = 1;
			userNumber += 1;
			LogAddUser(newUser);
		}
	}

	// ????
	function RemoveUser(address rmUser) onlyOwner {
		if (usersAddress[rmUser] == 1) {
			usersAddress[rmUser] = 0;
			userNumber -= 1;
			LogRmUser(rmUser);
		}
	}

	// ????
	function Withdrew() onlyMember {
		// ?????? contract ? balance ??????????
		uint totalMined = this.balance + totalWithdrew;
		// ???????? ?????????? ?? ??????????
		uint avaliableWithdrew = totalMined/userNumber - usersWithdrew[msg.sender];
		// ??????
		usersWithdrew[msg.sender] += avaliableWithdrew;
		// ???????
		totalWithdrew += avaliableWithdrew;
		// ??????????
		if (avaliableWithdrew > 0) {
			// ?? ETH ???? address
			msg.sender.transfer(avaliableWithdrew);
			LogWithdrew(msg.sender, avaliableWithdrew);
		} else
			throw;
	}

	// ?? contract ????
	function () payable {}
}