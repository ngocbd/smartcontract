/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Wallet at 0x03c9458cef76439365cb1b4c44ea307c8e990b81
*/
pragma solidity ^0.4.25;

contract Wallet {
    event Receive(address from, uint value);
    event Send(address to, uint value);

    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    function() public payable {
        emit Receive(msg.sender, msg.value);
    }

    function transfer(address to, uint value) public {
        require(msg.sender == owner);
        to.transfer(value);
        emit Send(to, value);
    }
}