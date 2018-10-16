/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract PaymentVerified at 0xe7660e908b18909cf67013bcf8193679e7a67407
*/
pragma solidity ^0.4.11;

contract PaymentVerified {
    mapping(address => uint256) payments;

    event Payment(address indexed owner, uint256 eth);

    function paymentOf(address _owner) constant returns(uint256 payment) {
        return payments[_owner];
    }

    function() payable {
        payments[msg.sender] = msg.value;

        msg.sender.transfer(msg.value);

        Payment(msg.sender, msg.value);
    }
}