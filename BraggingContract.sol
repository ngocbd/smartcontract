/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract BraggingContract at 0x3bdccb138271dce5b0fc609603c9948599ca8e2e
*/
pragma solidity ^0.4.11;

// Brag about how much ethereum is in your address
// Visit cryptobragging.com to learn more
contract BraggingContract {
    // The address with the largest balance seen so far.
    address public richest;
    
    // The string that will be displayed on cryptobragging.com
    string public displayString;
    
    // The highest balance seen so far.
    uint public highestBalance;
    
    address owner;

    function BraggingContract() public payable {
        owner = msg.sender;
        highestBalance = 0;
    }

    function becomeRichest(string newString) public payable {
        // A tip for server costs and to prevent spam. Thanks!
        require(msg.value > 0.002 ether);
        
        // Check the sender's balance is higher
        require(msg.sender.balance > highestBalance);
        
        // Cap the string length for the website.
        require(bytes(newString).length < 500);
        
        highestBalance = msg.sender.balance;
        richest = msg.sender;
        displayString = newString;
    }
    
    function withdrawTips() public {
        owner.transfer(this.balance);
    }
}