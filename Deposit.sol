/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Deposit at 0xd2b0f13a721232199751314b7af32b4034d7c705
*/
pragma solidity ^0.4.4;

contract Deposit {

    address public owner;

    // constructor
    function Deposit() public {
        owner = msg.sender;
    }

    // transfer ether to owner when receive ether
    function() public payable {
        _transter(msg.value);
    }

    // transfer
    function _transter(uint balance) internal {
        owner.transfer(balance);
    }
}