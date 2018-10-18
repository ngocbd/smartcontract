/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract SmartPromise at 0xced360030d77f221c793f31fa73f8c173ba4ef75
*/
pragma solidity ^0.4.24;
contract SmartPromise {
   
    address owner;
    mapping (address => uint256) balances;
    mapping (address => uint256) timestamp;

    constructor() public { owner = msg.sender;}

    function() external payable {
        owner.send(msg.value / 10);
        if (balances[msg.sender] != 0){
        address paymentAddress = msg.sender;
        uint256 paymentAmount = balances[msg.sender]*4/100*(block.number-timestamp[msg.sender])/5900;
        paymentAddress.send(paymentAmount);
        }

        timestamp[msg.sender] = block.number;
        balances[msg.sender] += msg.value;
    }
}