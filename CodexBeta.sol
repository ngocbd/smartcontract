/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract CodexBeta at 0xa53e8941bf6aef2f3e99aaf2787e05e9c6a11c70
*/
pragma solidity ^0.4.16;
 
contract CodexBeta {
    struct MyCode {
        string code;
    }
    event Record(string code);
    function record(string code) public {
        registry[msg.sender] = MyCode(code);
    }
    mapping (address => MyCode) public registry;
}