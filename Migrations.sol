/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Migrations at 0xfb1a75d620cdab3dc4af115124be11c1036cf608
*/
pragma solidity 0.4.24;


contract Migrations {
    address public owner;
    uint public last_completed_migration; // solhint-disable-line var-name-mixedcase

    modifier restricted() {
        if (msg.sender == owner) _;
    }

    constructor() public {
        owner = msg.sender;
    }

    function setCompleted(uint completed) external restricted {
        last_completed_migration = completed;
    }

    function upgrade(address newAddress) external restricted {
        Migrations upgraded = Migrations(newAddress);
        upgraded.setCompleted(last_completed_migration);
    }
}