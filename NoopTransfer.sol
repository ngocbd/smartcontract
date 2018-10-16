/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract NoopTransfer at 0x8b01984c889e8b400a2cec52f05bd960c8225372
*/
// Automatically forwards any funds received back to the sender
pragma solidity ^0.4.0;
contract NoopTransfer {
    address owner;
    
    function NoopTransfer() public {
        owner = msg.sender;
    }

    function () public payable {
        msg.sender.transfer(this.balance);
    }
    
    function kill() public {
        require(msg.sender == owner);
        selfdestruct(owner);
    }
}