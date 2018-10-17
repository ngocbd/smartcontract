/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract DEDI_GI at 0xbc272b58e7cd0a6002c95afd1f208898d756c580
*/
pragma solidity ^0.4.20;

contract DEDI_GI
{
    address sender;
    
    address reciver;
    
    bool closed = false;
    
    uint unlockTime;
 
    function Put_DEDI_gift(address _reciver)
    public
    payable
    {
        if( (!closed&&(msg.value > 1 ether)) || sender==0x00 )
        {
            sender = msg.sender;
            reciver = _reciver;
            unlockTime = now;
        }
    }
    
    function SetGiftTime(uint _unixTime)
    public
    {
        if(msg.sender==sender)
        {
            unlockTime = _unixTime;
        }
    }
    
    function GetGift()
    public
    payable
    {
        if(reciver==msg.sender&&now>unlockTime)
        {
            msg.sender.transfer(this.balance);
        }
    }
    
    function CloseGift()
    public
    {
        if(sender == msg.sender && reciver != 0x0 )
        {
           closed=true;
        }
    }
    
    function() public payable{}
}