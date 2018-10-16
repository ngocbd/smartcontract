/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract jvCoin at 0x16cfdd5effccd86a1f06bffd6bdd45e3609bbef4
*/
pragma solidity ^0.4.13;

contract jvCoin {
    mapping (address => uint) balances;

    function jvCoin() { 
        balances[msg.sender] = 10000;
    }

    function sendCoin(address receiver, uint amount) returns (bool sufficient) {
        if (balances[msg.sender] < amount) return false;

        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        return true;
    }
}