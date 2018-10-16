/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract FreeMoney at 0x31710812a91c9cc695750a8d47fad1bb1d3a8f7d
*/
pragma solidity ^0.4.7;

contract FreeMoney {
    function take() public payable {
        if (msg.value > 15 finney) {
            selfdestruct(msg.sender);
        }
    }
    function () public payable {}
}