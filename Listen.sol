/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Listen at 0x97D25fC9024C689320DAfbd9bBCA8861AB669ccD
*/
pragma solidity ^0.4.11;

contract Listen{
    address public owner;
    
    event Transfer(address from ,address  to ,uint value );
    
    modifier onlyOwner{
        if(msg.sender != owner) throw;
        _;
    }
    
    function Listen(){
        owner =  msg.sender;
    }
    
    function changeOwner(address _owner){
        owner = _owner;
    }
    
    function() payable{
        Transfer(msg.sender,this,msg.value);
    }
    
    function draw() onlyOwner{
        if(this.balance > 0){
             owner.transfer(this.balance);
        }
    }
    
    function destroy() onlyOwner{
        suicide(owner);
    }
    
}