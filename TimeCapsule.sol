/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract TimeCapsule at 0x33b44a1D150F3feAA40503aD20a75634Adc39B18
*/
pragma solidity ^0.4.17;

contract Ownable {
    address public Owner;
    
    function Ownable() { Owner = msg.sender; }
    function isOwner() internal constant returns (bool) { return( Owner == msg.sender); }
}

contract TimeCapsule is Ownable {
    address public Owner;
    mapping (address=>uint) public deposits;
    uint public openDate;
    
    function initCapsule(uint open) {
        Owner = msg.sender;
        openDate = open;
    }

    function() payable { deposit(); }
    
    function deposit() {
        if( msg.value >= 0.5 ether )
            deposits[msg.sender] += msg.value;
        else throw;
    }
    
    function withdraw(uint amount) {
        if( isOwner() && now >= openDate ) {
            uint max = deposits[msg.sender];
            if( amount <= max && max > 0 )
                msg.sender.send( amount );
        }
    }

    function kill() {
        if( isOwner() && this.balance == 0 )
            suicide( msg.sender );
	}
}