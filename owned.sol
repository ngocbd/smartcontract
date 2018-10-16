/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract owned at 0x97680599b29491dF74c15ad129c635D9ebAa03b8
*/
contract owned {
  function owned() {
    owner = msg.sender;
  }
  modifier onlyowner() {
    if (msg.sender == owner)
    _
  }
  function kill() {  //remove in production
    if (msg.sender == owner)
    suicide(owner);
  }
  function transfer(address addr) { 
    if (msg.sender == owner)
      owner = addr;
  }
  address public owner;
}