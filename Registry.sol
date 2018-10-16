/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Registry at 0x61ab321758fe7a302026b8831d1532c7c9cebe21
*/
pragma solidity ^0.4.4;

contract Registry {
  address owner;
  mapping (address => uint) public expirations;
  uint public weiPerBlock;
  uint public minBlockPurchase;

  function Registry() {
    owner = msg.sender;
    // works out to about $7 per month
    weiPerBlock = 100000000000;
    // roughly 1 day worth of blocks at 20 sec transaction time
    minBlockPurchase = 4320;
  }

  function () payable {
    uint senderExpirationBlock = expirations[msg.sender];
    if (senderExpirationBlock > 0 && senderExpirationBlock < block.number) {
      // The sender already has credit, add to it
      expirations[msg.sender] = senderExpirationBlock + blocksForWei(msg.value);
    } else {
      // The senders credit has either expired or the sender is unregistered
      // Give them block credits starting from the current block
      expirations[msg.sender] = block.number + blocksForWei(msg.value);
    }
  }

  function blocksForWei(uint weiValue) returns (uint) {
    assert(weiValue >= weiPerBlock * minBlockPurchase);
    return weiValue / weiPerBlock;
  }

  function setWeiPerBlock(uint newWeiPerBlock) {
    if (msg.sender == owner) weiPerBlock = newWeiPerBlock;
  }

  function setMinBlockPurchase(uint newMinBlockPurchase) {
    if (msg.sender == owner) minBlockPurchase = newMinBlockPurchase;
  }

  function withdraw(uint weiValue) {
    if (msg.sender == owner) owner.transfer(weiValue);
  }

}