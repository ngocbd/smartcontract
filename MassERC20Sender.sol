/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract MassERC20Sender at 0x9ca884a37a87eb14cfc0dbe4bc47c119b9272fe0
*/
pragma solidity ^0.4.21;

contract ERC20 {
  function transfer(address to, uint256 value) public returns (bool);
}

contract MassERC20Sender   {
    address public backupOwner;
    address public owner;

    function MassERC20Sender(address backupOwner_) public{
        owner = msg.sender;
        backupOwner = backupOwner_;
    }

    modifier onlyOwner() {
        require(msg.sender == owner || msg.sender == backupOwner);
        _;
    }

    function multisend(ERC20 _tokenAddr, address[] dests, uint256[] values) onlyOwner public returns (uint256) {
        uint256 i = 0;
        while (i < dests.length) {
            _tokenAddr.transfer(dests[i], values[i]);
            i += 1;
        }
        return(i);
    }

    function withdraw() onlyOwner public{
        owner.transfer(this.balance);
    }

    function setBackupOwner(address backupOwner_) onlyOwner public{
        backupOwner = backupOwner_;
    }
}