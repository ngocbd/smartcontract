/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Zhtong at 0x2bb2f9183e246fc4c157a791c09772016309cd34
*/
contract Zhtong {
    address public owner;
      uint private result;
      function Set(){
          owner = msg.sender;
      }
      function assign(uint x, uint y) returns (uint){
          result = x + y;
      }
}