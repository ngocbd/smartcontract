/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract FlightDelayAddressResolver at 0xa2e4fb662ba999a1e1bac839340c4d34e36e5d19
*/
// File: contracts/FlightDelayAddressResolver.sol

/*
  Copyright (c) 2015-2016 Oraclize SRL
  Copyright (c) 2016 Oraclize LTD
*/

pragma solidity ^0.4.11;


contract FlightDelayAddressResolver {

    address public addr;

    address owner;

    function FlightDelayAddressResolver() public {
        owner = msg.sender;
    }

    function changeOwner(address _owner) public {
        require(msg.sender == owner);
        owner = _owner;
    }

    function getAddress() public constant returns (address _addr) {
        return addr;
    }

    function setAddress(address _addr) public {
        require(msg.sender == owner);
        addr = _addr;
    }
}