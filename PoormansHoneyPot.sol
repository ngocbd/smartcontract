/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract PoormansHoneyPot at 0x2a98d8fc14b31b346ff6c56dc2a252c434f628f2
*/
pragma solidity ^0.4.23;

contract PoormansHoneyPot {
    mapping (address => uint) public balances;

    constructor() public payable {
        store();
    }

    function store() public payable {
        balances[msg.sender] = msg.value;
    }

    function withdraw() public{
        assert (msg.sender.call.value(balances[msg.sender])()) ;
        balances[msg.sender] = 0;
    }


}