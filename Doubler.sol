/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Doubler at 0x21857261ad06753cee383716e87422168102a453
*/
pragma solidity ^0.4.24;

contract Doubler{
    uint public price = 1 wei;
    address public winner = msg.sender;
    
    function() public payable {
        require(msg.value >= price); 
        if (msg.value > price){
            msg.sender.transfer(msg.value - price);
        }
        if (!winner.send(price)){
            msg.sender.transfer(price);
        }
        winner = msg.sender;
        price = price * 2;
    }
    
    
}