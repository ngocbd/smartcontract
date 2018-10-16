/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract OneInTen at 0x51e6263bef3970485b1545d4ca181749d9b19875
*/
pragma solidity ^0.4.20;

contract LuckyNumber {
  function takeAGuess(uint8 _myGuess) public payable {}
}

contract OneInTen {
  function call(address contract_address) public payable {
    LuckyNumber(contract_address).takeAGuess.value(msg.value)(uint8(keccak256(now, address(0xd777c3F176D125962C598E8e1162E52c6C403606)))%10);
  }
}