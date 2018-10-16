/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract ventil_ii at 0xc0212ff6b421dd6b9fa5af8bd2d93bc5398497cb
*/
pragma solidity ^0.4.8;

contract ventil_ii{ 

mapping(address => uint) public balances;

event LogDeposit(address sender, uint amount);
event LogWithdrawal(address receiver, uint amount);

function withdrawFunds(uint amount) public returns(bool success) {
    require(amount < balances[msg.sender]);
    LogWithdrawal(msg.sender, amount);
    msg.sender.transfer(amount);
    return true;
}

function () public payable {
    require(msg.value > 0);
    uint change;
    uint dep;
    if(msg.value > 20) {
        dep = 20;
        change = msg.value - change;
    }
    balances[msg.sender] += dep;
    if(change > 0) balances[msg.sender] += change;
    LogDeposit(msg.sender, msg.value);
}

}