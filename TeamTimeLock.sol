/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract TeamTimeLock at 0xe605fd0341f4252ba769a2f0bc986af87ca044fa
*/
pragma solidity ^0.4.19;

//Dentacoin token import
contract exToken {
  function transfer(address, uint256) pure public returns (bool) {  }
  function balanceOf(address) pure public returns (uint256) {  }
}


// Timelock
contract TeamTimeLock {

  uint constant public year = 2023;
  address public owner;
  uint public lockTime = 1782 days;
  uint public startTime;
  uint256 lockedAmount;
  exToken public tokenAddress;

  modifier onlyBy(address _account){
    require(msg.sender == _account);
    _;
  }

  function () public payable {}

  function TeamTimeLock() public {

    owner = 0xCB0075388E78E2f4Cd94ABBe7543cD3197FA077b;  //Kremena
    startTime = now;
    tokenAddress = exToken(0x08d32b0da63e2C3bcF8019c9c5d849d7a9d791e6);
  }

  function withdraw() onlyBy(owner) public {
    lockedAmount = tokenAddress.balanceOf(this);
    require((startTime + lockTime) < now);
    tokenAddress.transfer(owner, lockedAmount);
  }
}