/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract HelloWorld at 0xDD9aE24a9E442Fd7af6Cd321400Cc8243458924F
*/
pragma solidity ^0.4.13;

contract HelloWorld {
    
    string wellcomeString = "Hello, world!";
    
    function getData() public constant returns (string) {
        return wellcomeString;
    }
    
    function setData(string newData) public {
        wellcomeString = newData;
    }
    
}