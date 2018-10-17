/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract BulletinBoard at 0x9d3473addd524da6624fc7941f658b75fe30e4c4
*/
pragma solidity ^0.4.24;

contract BulletinBoard {

    struct Message {
        address sender;
        string text;
        uint timestamp;
        uint payment;
    }

    Message[] public messages;
    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    function addMessage(string text) public payable {
        require(msg.value >= 0.000001 ether * bytes(text).length);
        messages.push(Message(msg.sender, text, block.timestamp, msg.value));
    }

    function numMessages() public constant returns (uint) {
        return messages.length;
    }

    function withdraw() public {
        require(msg.sender == owner);
        msg.sender.transfer(address(this).balance);
    }
}