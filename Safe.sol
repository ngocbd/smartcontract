/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Safe at 0x4548014e7657d235d1bb200c82b11ac4ee448a4a
*/
pragma solidity ^0.4.15;

contract Token {
    function transfer(address _to, uint _value) returns (bool success);
}

contract Safe {
    address public owner;
    uint256 public lock;

    function Safe() {
        owner = msg.sender;
    }
    
    function transfer(address to) returns (bool) {
        require(msg.sender == owner);
        require(to != address(0));
        owner = to;
        return true;
    }

    function lock(uint256 timestamp) returns (bool) {
        require(msg.sender == owner);
        require(timestamp > lock);
        require(timestamp > block.timestamp);
        lock = timestamp;
        return true;
    }

    function withdrawal(Token token, address to, uint value) returns (bool) {
        require(msg.sender == owner);
        require(block.timestamp >= lock);
        require(to != address(0));
        return token.transfer(to, value);
    }
}