/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Conference at 0x7fe180e63198e50057c3f2817d058e8904c650e3
*/
pragma solidity ^0.4.6;

contract Conference {  // can be killed, so the owner gets sent the money in the end

	address public organizer;
	mapping (address => uint) public registrantsPaid;
	uint public numRegistrants;
	uint public quota;

	event Deposit(address _from, uint _amount); // so you can log the event
	event Refund(address _to, uint _amount); // so you can log the event

	function Conference() {
		organizer = msg.sender;		
		quota = 100;
		numRegistrants = 0;
	}

	function buyTicket() public {
		if (numRegistrants >= quota) { 
			throw; // throw ensures funds will be returned
		}
		registrantsPaid[msg.sender] = msg.value;
		numRegistrants++;
		Deposit(msg.sender, msg.value);
	}

	function changeQuota(uint newquota) public {
		if (msg.sender != organizer) { return; }
		quota = newquota;
	}

	function refundTicket(address recipient, uint amount) public {
		if (msg.sender != organizer) { return; }
		if (registrantsPaid[recipient] == amount) { 
			address myAddress = this;
			if (myAddress.balance >= amount) { 
				(recipient.send(amount));
				Refund(recipient, amount);
				registrantsPaid[recipient] = 0;
				numRegistrants--;
			}
		}
		return;
	}

	function destroy() {
		if (msg.sender == organizer) { // without this funds could be locked in the contract forever!
			suicide(organizer);
		}
	}
}