/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract PonziScheme at 0xc58492b3b14f658adff566c988029308505f81b5
*/
pragma solidity ^0.4.11;

contract PonziScheme {
  uint public round;
  address public lastDepositor;
  uint public lastDepositorAmount;
  uint public startingAmount;
  uint public nextAmount;

  function PonziScheme(uint _startingAmount) {
    round = 1;
    startingAmount = _startingAmount;
    nextAmount = _startingAmount;
  }

  function() payable {
    if(round == 1) {
      if(msg.value != startingAmount) {
        throw;
      }
    } else {
      checkAmount(msg.value);

      lastDepositor.send(msg.value);
    }

    lastDepositorAmount = msg.value;
    lastDepositor = msg.sender;
    nextAmount = msg.value * 2;

    increaseRound();
  }

  function checkAmount(uint amount) private {
    if(amount != lastDepositorAmount * 2) {
      throw;
    }
  }

  function increaseRound() private {
    round = round + 1;
  }
}