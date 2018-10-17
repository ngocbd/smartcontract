/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract ViewBalances at 0x3ab1cff0e83caf8df884dff5491a6bc4aa1c0f6c
*/
pragma solidity ^0.4.24;


contract ViewBalances {
  
  constructor() public{}
    
  function checkBalances(address[] addresses) public constant returns(uint256[]){
      uint256[] storage balances;
      for(uint256 i = 0; i < addresses.length; i++){
          balances.push(addresses[i].balance);
      }
      return balances;
  }        

}