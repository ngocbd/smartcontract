/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Distributor at 0x1987a7e3379c9f963a4d8c717342dae7dbe51b55
*/
pragma solidity ^0.4.18;

contract Distributor {

  address public owner;

  mapping (address => uint) public received;
    
  mapping (address => uint) public balances;

  address[] public receivers;
  
  uint public index;
  
  uint public total;

  modifier onlyOwner() {
    require(owner == msg.sender);
    _;
  }
  
  function Distributor() public {
      owner = msg.sender;
  }
  
  function addReceivers(address[] _receivers, uint[] _balances) public onlyOwner {
    for(uint i = 0; i < _receivers.length; i++) {
      address receiver = _receivers[i];
      require(balances[receiver] == 0);
      balances[receiver] = _balances[i];
      total += _balances[i];
      receivers.push(receiver);
    }
  }

  function process(uint count) public onlyOwner {
    for(uint i = 0; index < receivers.length && i < count; i++) {
      address receiver = receivers[index];
      require(received[receiver] == 0);
      uint value = balances[receiver];
      received[receiver] = balances[receiver];
      receiver.transfer(value);
      index++;
    }
  }

  function () public payable {
  }
  
  function retreive() public onlyOwner {
    owner.transfer(this.balance);
  }
    
}