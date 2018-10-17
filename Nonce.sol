/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Nonce at 0x3c535ee4d0bdfb3dd338fe9b0e005eb2d14fab63
*/
pragma solidity ^0.4.24;

contract Nonce {
    event IncrementEvent(address indexed _sender, uint256 indexed _newNonce);
    uint256 value;
    
    function increment() public returns (uint256) {
        value = ++value;
        emit IncrementEvent(msg.sender, value);
        return value;
    }
    
    function getValue() public view returns (uint256) {
        return value;
    }
}