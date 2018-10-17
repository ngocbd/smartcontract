/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract PayChannel at 0xf9083b4d79339f02eb8a5db22099854b92854cc3
*/
pragma solidity ^0.4.24;

contract PayChannel {

    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    function () payable public {
        owner.transfer(msg.value);
    }
}