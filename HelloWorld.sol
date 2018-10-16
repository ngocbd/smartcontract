/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract HelloWorld at 0x448b142f7607cfb163919a0c6252c393327d54b3
*/
pragma solidity ^0.4.13;
 
contract HelloWorld {
    
    string wellcomeString = "Hello, world!";
    
    function getData() constant returns (string) {
        return wellcomeString;
    }
    
    function setData(string newData) {
        wellcomeString = newData;
    }
    
}