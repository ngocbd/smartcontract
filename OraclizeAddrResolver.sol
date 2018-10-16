/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract OraclizeAddrResolver at 0x1d11e5eaE3112dbD44f99266872FF1D07C77DCe8
*/
/*
Copyright (c) 2015-2016 Oraclize srl, Thomas Bertani
*/

contract OraclizeAddrResolver {

    address public addr;
    
    address owner;
    
    function OraclizeAddrResolver(){
        owner = msg.sender;
    }
    
    
    function getAddress() returns (address oaddr){
        return addr;
    }
    
    function setAddr(address newaddr){
        if (msg.sender != owner) throw;
        addr = newaddr;
    }
    
}