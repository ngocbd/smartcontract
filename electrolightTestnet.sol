/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract electrolightTestnet at 0x6a2f31ef89ca3b99c36ee10fd0b958fed621dc36
*/
pragma solidity ^0.4.21; //tells that the source code is written for Solidity version 0.4.21 or anything newer that does not break functionality


contract electrolightTestnet {
    // The keyword "public" makes those variables readable from outside.
    
    address public minter;
    
    // Events allow light clients to react on changes efficiently.
    mapping (address => uint) public balances;
    
    // This is the constructor whose code is run only when the contract is created
    event Sent(address from, address to, uint amount);
    
    function electrolightTestnet() public {
        
        minter = msg.sender;
        
    }
    
    function mint(address receiver, uint amount) public {
        
        if(msg.sender != minter) return;
        balances[receiver]+=amount;
        
    }
    
    function send(address receiver, uint amount) public {
        if(balances[msg.sender] < amount) return;
        balances[msg.sender]-=amount;
        balances[receiver]+=amount;
        emit Sent(msg.sender, receiver, amount);
        
    }
    
    
}