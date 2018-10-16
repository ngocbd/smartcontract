/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Refund at 0xa1089ac6c47575c3b23b92babd85d3c61329847d
*/
pragma solidity ^0.4.16;
contract Refund {
    address owner = 0x0;
    function Refund() public payable {
        // ???????????????
        owner = msg.sender;
    }
    

}