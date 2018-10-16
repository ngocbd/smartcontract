/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract SharedBank at 0x641074844a0dd00042347161f830346bdfe348bc
*/
pragma solidity ^0.4.10;

contract Owned {
    address public Owner;
    function Owned() { Owner = msg.sender; }
    modifier onlyOwner { require( msg.sender == Owner ); _; }
}

contract SharedBank is Owned {
    address public Owner;
    mapping (address=>uint) public deposits;
    
    function init() { Owner = msg.sender; }
    
    function() payable { deposit(); }
    
    function deposit() payable {
        if( msg.value >= 1 ether )
            deposits[msg.sender] += msg.value;
        else return;
    }
    
    function withdraw(uint amount) onlyOwner {
        uint depo = deposits[msg.sender];
        if( amount <= depo && depo > 0 )
            msg.sender.send(amount);
    }

    function kill() onlyOwner {
        require(this.balance == 0);
        suicide(msg.sender);
	}
}