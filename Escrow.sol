/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Escrow at 0xe28942df3b9502193a3547e6f6bad16ce63b1e2d
*/
pragma solidity ^0.4.13;

contract Escrow {
    mapping (address => uint) public balances;

    function deposit(address _recipient) payable {
        require(msg.value > 0);
        balances[_recipient] += msg.value;
    }

    function claim() {
        uint balance = balances[msg.sender];
        require(balance > 0);

        balances[msg.sender] = 0;
        bool claimed = msg.sender.call.value(balance)();

        require(claimed);
    }
}