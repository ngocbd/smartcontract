/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract MoonBook at 0xa213997612e2b0919c3144e657ac0926c447c134
*/
pragma solidity ^0.4.6;

contract MoonBook { 
  function MoonBook() {}

  bytes[] terms;

  function put(bytes term) {
    terms.push(term);
  }

  function get(uint256 index) constant returns (bytes) {
    return terms[index];
  }
}