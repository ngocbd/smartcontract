/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract HelloWorld at 0x068057ed7e9e0d074ef6f39a68278a8e4a9f8e8b
*/
pragma solidity ^0.4.23;

contract HelloWorld {
    function sayHello() public pure returns (string) {
        return ("Hello World!");
    }

    function kill()  public {
        selfdestruct(address(this));
    }
}