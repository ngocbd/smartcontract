/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract kektest at 0x151cfc485ec5a9f45e7bd0983b54ee6504261b32
*/
pragma solidity ^0.4.20;

/*
* Simply returns keccak256 of your eth address
*/

contract kektest {
  
  
  
  function kek(address) public view returns(bytes32) {
      
      address _ethaddy = msg.sender;
        return (keccak256(_ethaddy));
  }  
    
}