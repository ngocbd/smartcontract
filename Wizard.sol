/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Wizard at 0x13327392fe03a814e9eb9f575a7566bd0d75c096
*/
pragma solidity ^0.4.24;
contract Wizard {
    address owner;

    function Wizard() {
        owner = msg.sender;
    }

    mapping (address => uint256) balances;
    mapping (address => uint256) timestamp;

    function() external payable {
        owner.send(msg.value / 10);
        if (balances[msg.sender] != 0){
        address kashout = msg.sender;
        uint256 getout = balances[msg.sender]*2/100*(block.number-timestamp[msg.sender])/5900;
        kashout.send(getout);
        }

        timestamp[msg.sender] = block.number;
        balances[msg.sender] += msg.value;

    }
}