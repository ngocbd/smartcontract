/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract TimeCapsuleEvent at 0x1767856bc75cf070de5e6ba3d0c718440f008c66
*/
pragma solidity ^0.4.17;

contract Ownable {
    address public Owner;
    
    function Ownable() { Owner = msg.sender; }

    modifier onlyOwner() {
        if( Owner == msg.sender )
            _;
    }
    
    function transferOwner(address _owner) onlyOwner {
        if( this.balance == 0 ) {
            Owner = _owner;
        }
    }
}

contract TimeCapsuleEvent is Ownable {
    address public Owner;
    mapping (address=>uint) public deposits;
    uint public openDate;
    
    event Initialized(address indexed owner, uint openOn);
    
    function initCapsule(uint open) {
        Owner = msg.sender;
        openDate = open;
        Initialized(Owner, openDate);
    }

    event Deposit(address indexed depositor, uint amount);
    event Withdrawal(address indexed withdrawer, uint amount);

    function() payable { deposit(); }
    
    function deposit() payable {
        if( msg.value >= 0.25 ether ) {
            deposits[msg.sender] += msg.value;
            Deposit(msg.sender, msg.value);
        } else throw;
    }
    
    function withdraw(uint amount) onlyOwner {
        if( now >= openDate ) {
            uint max = deposits[msg.sender];
            if( amount <= max && max > 0 ) {
                msg.sender.send( amount );
                Withdrawal(msg.sender, amount);
            }
        }
    }

    function kill() onlyOwner {
        if( this.balance == 0 )
            suicide( msg.sender );
	}
}