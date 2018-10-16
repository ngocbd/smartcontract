/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract whoSays at 0x53570f9db0d81af09d9ef418e37e025668eed05f
*/
pragma solidity ^0.4.0;
contract whoSays {

    string public name = "whoSays";

    mapping(address => bytes) public data;

    event Said(address indexed person, bytes message);

    function saySomething(bytes _data) public {
        data[msg.sender] = _data;
        Said(msg.sender, _data);
    }

}