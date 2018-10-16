/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract SafeM at 0xc7dc19502db685fbfe3399042d443fef240d513b
*/
library SafeM {

  function add(uint a, uint b) public pure returns (uint c) {
    c = a + b;
    require( c >= a );
  }

  function sub(uint a, uint b) public pure returns (uint c) {
    require( b <= a );
    c = a - b;
  }

  function mul(uint a, uint b) public pure returns (uint c) {
    c = a * b;
    require( a == 0 || c / a == b );
  }

  function div(uint a, uint b) public pure returns (uint c) {
    c = a / b;
  }  

}