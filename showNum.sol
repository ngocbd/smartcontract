/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract showNum at 0xf0ec09b983766d419c813da55b110d8d7fb28de0
*/
pragma solidity ^0.4.4;


contract showNum {
    address owner = msg.sender;

    uint _num = 0;
   function setNum(uint number) public payable {
        _num = number;
    }

    function getNum() constant public returns(uint) {
        return _num;
    }
}