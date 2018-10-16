/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract NiceGuyPonzi at 0x428Da5ff72D8Be0EfAa85336B6c6A9fC9E0F73fe
*/
contract NiceGuyPonzi {

  struct Person {
      address etherAddress;
      uint amount;
  }

  Person[] public persons;

  uint public payoutIdx = 0;
  uint public collectedFees;
  uint public balance = 0;
  uint public niceGuy;

  address public owner;


  modifier onlyowner { if (msg.sender == owner) _ }


  function NiceGuyPonzi() {
    owner = msg.sender;
  }

  function() {
    enter();
  }
  
  function enter() {
    if (msg.value < 1/100 ether) {
        msg.sender.send(msg.value);
        return;
    }
	
		uint amount;
		if (msg.value > 10 ether) {
			msg.sender.send(msg.value - 10 ether);	
			amount = 10 ether;
    }
		else {
			amount = msg.value;
		}

    if (niceGuy < 10){
        uint idx = persons.length;
        persons.length += 1;
        persons[idx].etherAddress = msg.sender;
        persons[idx].amount = amount;
        niceGuy += 1;
    }
    else {
        owner = msg.sender;
        niceGuy = 0;
        return;
    }
    
    if (idx != 0) {
      collectedFees += amount / 10;
	  owner.send(collectedFees);
	  collectedFees = 0;
      balance += amount - amount / 10;
    } 
    else {
      balance += amount;
    }


    while (balance > persons[payoutIdx].amount / 100 * 125) {
      uint transactionAmount = persons[payoutIdx].amount / 100 * 125;
      persons[payoutIdx].etherAddress.send(transactionAmount);
      balance -= transactionAmount;
      payoutIdx += 1;
    }
  }


  function setOwner(address _owner) onlyowner {
      owner = _owner;
  }
}