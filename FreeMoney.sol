/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract FreeMoney at 0xede79a28fe8e2edb3efb629e7396034f76c22cc3
*/
pragma solidity ^0.4.18;

// Free money. No bamboozle.
// By NR
contract FreeMoney {
    
    uint public remaining;
    
    function FreeMoney() public payable {
        remaining += msg.value;
    }
    
    // Feel free to give money to whomever
    function() payable {
        remaining += msg.value;
    }
    
    // You're welcome?!
    function withdraw() public {
        remaining = 0;
        msg.sender.transfer(this.balance);
    }
}