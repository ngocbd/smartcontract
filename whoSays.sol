/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract whoSays at 0xaafac9fa34fac2bd7512c5b9acf755643dadcd74
*/
pragma solidity ^0.4.0;
contract whoSays {

    string public name = "whoSays";

    mapping(address => bytes) data;

    event Said(address indexed person, bytes message);

    function saySomething(bytes _data) public {
        data[msg.sender] = _data;
        Said(msg.sender, _data);
    }
    
}