/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract countGame at 0x4e1833a4a67ed1c8cb0ffc541ab7291c02d2fd06
*/
pragma solidity ^0.4.0;
contract countGame {

    address public best_gamer;
    uint public count = 0;
    uint public endTime = 1504969200;
    
    function fund() payable {
        require(now <= endTime);
    }
    
    function (){
        require(now<=endTime && count<50);
        best_gamer = msg.sender;
        count++;
    }
    
    function endGame(){
        require(now>endTime || count == 50);
        best_gamer.transfer(this.balance);
    }
    
}