/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract OriginalMyDocAuthenticity at 0x5515c7c8420d203a30eea9cdbf166e84ab7900c7
*/
pragma solidity ^0.4.11;

contract OriginalMyDocAuthenticity {
    
  mapping (string => uint) private authenticity;

  function storeAuthenticity(string sha256) {
    if (checkAuthenticity(sha256) == 0) {
        authenticity[sha256] = now;
    }   
  }

  function checkAuthenticity(string sha256) constant returns (uint) {
    return authenticity[sha256];
  }
}