/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Lottery50chance at 0x08fc24c9128591b74191fcff6833e746ba67d63e
*/
//demonstration of a how a honeypot contract is exploiting the way uninitialized storage pointers are handled

pragma solidity ^0.4.25;
contract Lottery50chance
{
  uint256 public randomNumber = 1;
  uint256 public minBet = 1 finney;
  address owner = msg.sender;

  struct GameHistory 
  {
    address player;
    uint256 number;
  }
  
  GameHistory[] public log;

  modifier onlyOwner() 
  {
    require(msg.sender == owner);
    _;
  }

  function play(uint256 _number) 
  public 
  payable 
  {
      if(msg.value >= minBet && _number <= 1)
      {
          GameHistory gameHistory;
          gameHistory.player = msg.sender;
          gameHistory.number = _number;
          log.push(gameHistory);
          
          // if player guesses correctly, transfer contract balance
          // else transfer to owner
       
          if (_number == randomNumber) 
          {
              msg.sender.transfer(address(this).balance);
          }else{
              owner.transfer(address(this).balance);
          }
          
      }
  }
  
  function withdraw(uint256 amount) 
  public 
  onlyOwner 
  {
    owner.transfer(amount);
  }

  function() public payable { }
  
}