/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Migrations at 0xf5d0f828777e52a9f0a8520756dd3de6949ba0c6
*/
pragma solidity ^0.4.18;

// File: contracts/Migrations.sol

contract Migrations {
    address public owner;
    uint public last_completed_migration;

    modifier restricted() {
        if (msg.sender == owner)
            _;
    }

    function Migrations() public {
        owner = msg.sender;
    }

    function setCompleted(uint completed) restricted public {
        last_completed_migration = completed;
    }

    function upgrade(address newAddress) restricted public {
        Migrations upgraded = Migrations(newAddress);
        upgraded.setCompleted(last_completed_migration);
    }
}