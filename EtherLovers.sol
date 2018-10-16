/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract EtherLovers at 0x5f5d7147adb6ed31a2ca03ce3defb070a3be0ebb
*/
pragma solidity ^0.4.1;

contract EtherLovers {

  event LoversAdded(string lover1, string lover2);

  uint constant requiredFee = 100 finney;

  address private owner;

  function EtherLovers() public {
    owner = msg.sender;
  }

  modifier isOwner() { 
    if (msg.sender != owner) {
      throw;       
    }
    _;
  }

  function declareLove(string lover1, string lover2) public payable {
    if (msg.value >= requiredFee) {
      LoversAdded(lover1, lover2);
    } else {
      throw;
    }
  }

  function collectFees() public isOwner() {
    msg.sender.send(this.balance);
  }

}