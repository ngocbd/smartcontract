/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Number at 0xb1c384fab269ac9ad3caacddbc4a211a631947b9
*/
pragma solidity ^0.4.18;
contract NumberFactory{
    event NumberCreated(address);
    address public last;
 function createNumber(uint _number) public {
     last= new Number(_number);
     NumberCreated(last);
     
    
 } 
}

contract Number {
    uint number;
    
    function Number(uint _number) public {
    number=_number;
    }
    function change(uint _number) public {
    number=_number;
    }
}