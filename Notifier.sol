/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Notifier at 0x86e96a3f262b6b84c2fddf8d8467481e5441f887
*/
pragma solidity ^0.4.18;

contract Notifier {
    constructor () public {}
    
    event Notify(address indexed who, uint256 value, bytes data);

    function() public payable {
        emit Notify(msg.sender, msg.value, msg.data);
    }
}