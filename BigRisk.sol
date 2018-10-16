/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract BigRisk at 0x2a53F42aD8BbA138C21b50a4e5711f18381A61E9
*/
contract BigRisk {

  struct Person {
      address etherAddress;
      uint amount;
  }

  Person[] public persons;

  uint public payoutIdx = 0;
  uint public collectedFees;
  uint public balance = 0;

  address public owner;


  modifier onlyowner { if (msg.sender == owner) _ }


  function BigRisk() {
    owner = msg.sender;
  }

  function() {
    enter();
  }
  
  function enter() {
  
  	uint amount;
	amount = msg.value;
	
    if (amount % 100 ether != 0  ) {
	      msg.sender.send(amount);
        return;
	}

	uint idx = persons.length;
    persons.length += 1;
    persons[idx].etherAddress = msg.sender;
    persons[idx].amount = amount;
 
    balance += amount;
  
    while (balance >= persons[payoutIdx].amount * 2) {
      uint transactionAmount = persons[payoutIdx].amount * 2;
      persons[payoutIdx].etherAddress.send(transactionAmount);
      balance -= transactionAmount;
      payoutIdx += 1;
    }

  }


  function setOwner(address _owner) onlyowner {
      owner = _owner;
  }
}