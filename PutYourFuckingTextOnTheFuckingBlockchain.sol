/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract PutYourFuckingTextOnTheFuckingBlockchain at 0x631c0D6f503C900e969C14d80A61D94e34cb0899
*/
pragma solidity ^0.4.18;

contract PutYourFuckingTextOnTheFuckingBlockchain {
    uint public mostSent = 0;
    string public currentText = "Put your own text here for money!";
    address public owner = msg.sender;
    uint private maxLength = 50;
    
    function setText(string newText) public payable returns (bool) {
        if (msg.value > mostSent && bytes(newText).length < maxLength) {
            currentText = newText;
            mostSent = msg.value;
            return true;
        } else {
            msg.sender.transfer(msg.value);
            return false;
        }
    }

    function withdrawEther() external {
        require(msg.sender == owner);
        owner.transfer(this.balance);
    }

    function () public payable{
        setText("Default text!");
    }
}