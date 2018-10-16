/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract callee at 0xe308310359e04c4c95dc0a72c92c3fe35ba1d8c6
*/
pragma solidity ^0.4.4;

contract callee {


    event outputi(uint i);
    event outputa(address a);
    event outputb(bytes32 b);
    
    function callee() {
    }
    
  function x (address a1, uint i1, address a2, uint i2, bytes32 b1, bytes32 b2) public {
    outputa(a1);
    outputi(i1);
    outputa(a2);
    outputi(i2);
    outputb(b1);
    outputb(b2);
  }

}