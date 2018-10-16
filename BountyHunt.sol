/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract BountyHunt at 0xb5766f61911f8b520b0e938aae100834aa3048c6
*/
pragma solidity ^0.4.4;

contract BountyHunt {
  mapping(address => uint) public bountyAmount;
  uint public totalBountyAmount;

  modifier preventTheft {
    _;  
    if (this.balance < totalBountyAmount) throw;
  }

  function grantBounty(address beneficiary, uint amount) payable preventTheft {
    bountyAmount[beneficiary] += amount;
    totalBountyAmount += amount;
  }

  function claimBounty() preventTheft {
    uint balance = bountyAmount[msg.sender];
    if (msg.sender.call.value(balance)()) {
      totalBountyAmount -= balance;
      bountyAmount[msg.sender] = 0;
    }   
  }

  function transferBounty(address to, uint value) preventTheft {
    if (bountyAmount[msg.sender] >= value) {
      bountyAmount[to] += value;
      bountyAmount[msg.sender] -= value;
    }   
  }
}