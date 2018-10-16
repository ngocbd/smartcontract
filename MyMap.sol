/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract MyMap at 0xc3a57bfa038765db73b935b621213cf3b1a7f996
*/
pragma solidity ^0.4.19;

contract MyMap {
    address public owner;
    mapping(bytes32=>bytes15) map;

    function MyMap() public {
        owner = msg.sender;
    }
    
    function setValue(bytes32 a, bytes15 b) public {
        if(owner == msg.sender) {
            map[a] = b;
        }
    }
}