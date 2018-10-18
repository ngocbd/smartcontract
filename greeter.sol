/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Greeter at 0x424bc5bfc7898644c91ca59eb9c47fad1a3a6384
*/
pragma solidity 0.4.21;

contract Greeter {
    string public greeting;
    
    function Greeter(string _greeting) public {
        setGreeting(_greeting);
    }
    
    function setGreeting(string _greeting) public {
        greeting = _greeting;
    }
    
}