/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Splitter at 0x98150dcb2c86b2e7fcd859e54ae8b627b385c28e
*/
pragma solidity ^0.4.18;

// Splitter is an Ether payment splitter contract between an owner and a payee
// account. Both payee and owner gets funded immediately upon receipt of payment, whilst
// the owner can withdraw accumulated funds upon request if something goes wrong


//THIS CONTRACT DEPLOYMENT USES 362992 GAS


contract Splitter {
    address public owner;   // Owner of the contract, will get `percent` of all transferred funds
    address public payee = 0xE413239e62f25Cc6746cD393920d123322aCa948;   // Payee of the contract, will get 100 - `percent` of all transferred funds
    uint    public percent = 10; // Percent of the funds to transfer to the payee (range: 1 - 99)
    
    // Splitter creates a fund splitter, forwarding 'percent' of any received funds
    // to the 'owner' and 100 percent for the payee.
    function Splitter() public {
        owner   = msg.sender;
    }
    
    // Withdraw pulls the entire (if any) balance of the contract to the owner's
    // account.
    function Withdraw() external {
        require(msg.sender == owner);
        owner.transfer(this.balance);
    }
    
    // Default function to accept Ether transfers and forward some percentage of it
    // to the owner's account and the payee
    function() external payable {
        owner.transfer(msg.value * percent / 100);
        payee.transfer(msg.value * (100 - percent) / 100);
    }
}