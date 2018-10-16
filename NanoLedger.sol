/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract NanoLedger at 0x04c6df85a9b0e8d2a7aa3c6f4891cd8d19dc75da
*/
pragma solidity ^0.4.21;

contract NanoLedger{
    
    mapping (uint => string) data;

    
    function saveCode(uint256 id, string dataMasuk) public{
        data[id] = dataMasuk;
    }
    
    function verify(uint8 id) view public returns (string){
        return (data[id]);
    }
}