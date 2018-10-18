/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract TeamPerfitForwarder at 0x01ceb9dddea083d647fa7b09942474dece629c7e
*/
pragma solidity ^0.4.24;

// File: contracts/TeamPerfitForwarder.sol

contract TeamPerfitForwarder {
    string public name = "TeamPerfitForwarder";
    address public owner;
    address public teamPerfitAddr;

    modifier onlyOwner {
        assert(owner == msg.sender);
        _;
    }

    constructor() 
        public
    {
        owner = msg.sender;
        teamPerfitAddr = msg.sender;
    }

    function() public payable
    {
        require(msg.value > 0, "zero value not allowed");

        teamPerfitAddr.transfer(msg.value);
    }

    function deposit() public payable returns(bool)
    {
        require(msg.value > 0, "Forwarder Deposit failed - zero deposits not allowed");

        teamPerfitAddr.transfer(msg.value);

        return true;
    }

    function status() public view returns(address, address)
    {
        return (address(teamPerfitAddr), address(owner));
    }

    function setTeamPerfitAddr(address newTeamPerfitAddr) public onlyOwner {
        teamPerfitAddr = newTeamPerfitAddr;
    }
}