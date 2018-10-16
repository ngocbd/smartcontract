/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract greeter at 0x674fc83f67B9668859A1d7882DFDbc384421C506
*/
pragma solidity ^0.4.11;

contract greeter {

    address owner;
    string message;

    function greeter(string _message) public {
        owner = msg.sender;
        message = _message;
    }

    function say() constant returns (string) {
        return message;
    }

    function die() {
        if (msg.sender == owner) {
            selfdestruct(owner);
        }
    }
}