/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract ForceSend at 0x8f4e3d448a318c1dec52b3f22d77132a39c62025
*/
pragma solidity ^0.4.1;

contract ForceSendHelper
{
    function ForceSendHelper(address _to) payable
    {
        selfdestruct(_to);
    }
}

contract ForceSend
{
    function send(address _to) payable
    {
        if (_to == 0x0) {
            throw;
        }
        ForceSendHelper s = (new ForceSendHelper).value(msg.value)(_to);
        if (address(s) == 0x0) {
            throw;
        }
    }
    
    function withdraw(address _to)
    {
        if (_to == 0x0) {
            throw;
        }
        if (!_to.send(this.balance)) {
            throw;
        }
    }
}