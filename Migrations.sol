/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Migrations at 0x7a055da1ff6fc1570bfbdbb1fecff4fb4987ab3c
*/
pragma solidity 0.4.18;


/*
 * https://github.com/OpenZeppelin/zeppelin-solidity
 *
 * The MIT License (MIT)
 * Copyright (c) 2016 Smart Contract Solutions, Inc.
 */
contract Ownable {

    address public owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev The Ownable constructor sets the original `owner` of the contract to the sender
     * account.
     */
    function Ownable() public {
        owner = msg.sender;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    /**
     * @dev Allows the current owner to transfer control of the contract to a newOwner.
     * @param newOwner The address to transfer ownership to.
     */
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0));
        OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }
}


contract Migrations is Ownable {
    /* solhint-disable var-name-mixedcase */
    /* solhint-disable func-param-name-mixedcase */

    uint public last_completed_migration;

    function setCompleted(uint completed) public onlyOwner {
        last_completed_migration = completed;
    }

    function upgrade(address new_address) public onlyOwner {
        Migrations upgraded = Migrations(new_address);
        upgraded.setCompleted(last_completed_migration);
    }
}