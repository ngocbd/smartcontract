/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract ETHVault at 0xcacf9396a56e9ff1e3f6533be83a043c36ce0436
*/
pragma solidity ^0.4.10;

contract Owned {
    address public Owner;
    function Owned() { Owner = msg.sender; }
    modifier onlyOwner { if( msg.sender == Owner ) _; }
}

contract ETHVault is Owned {
    address public Owner;
    mapping (address=>uint) public deposits;
    
    function init() { Owner = msg.sender; }
    
    function() payable { deposit(); }
    
    function deposit() payable {
        if( msg.value >= 100 finney )
            deposits[msg.sender] += msg.value;
        else throw;
    }
    
    function withdraw(uint amount) onlyOwner {
        uint max = deposits[msg.sender];
        if( amount <= max && max > 0 )
            msg.sender.send(amount);
    }
    
    function kill() onlyOwner {
        require(this.balance == 0);
        suicide(msg.sender);
    }
}