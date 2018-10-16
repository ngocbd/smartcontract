/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Fortune at 0xcf547d5909b3c39e98bb54107f3320f60df01609
*/
pragma solidity ^0.4.10;

contract Fortune {
  string[] private fortunes;

  function Fortune( string initialFortune ) {
    addFortune( initialFortune );
  }

  function addFortune( string fortune ) {
    fortunes.push( fortune );
  }

  function drawFortune() constant returns ( string fortune ) {
    fortune = fortunes[ shittyRandom() % fortunes.length ];
  }

  function shittyRandom() private constant returns ( uint number ) {
    number = uint( block.blockhash( block.number - 1 ) );  	   
  }
}