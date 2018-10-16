/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Incrementer at 0x8402f958b250128711921a46a5d21a932d2eb386
*/
pragma solidity ^0.4.11;

contract Incrementer {

    event LogWinner(address winner, uint amount);
    
    uint c = 0;

    function ticket() payable {
        
        uint ethrebuts = msg.value;
        if (ethrebuts != 10) {
            throw;
        }
        c++;
        
        if (c==3) {
            LogWinner(msg.sender,this.balance);
            msg.sender.transfer(this.balance);
            c=0;
        }
    }
}