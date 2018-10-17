/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Jeopardy at 0x757167d6238936428d9baf0a29605b2783e3b925
*/
pragma solidity ^0.4.24;

contract Jeopardy {
    bytes32 private answerHash;
    bool private isActive;
    Guess[] public guesses;
    string public riddle;
    string public answer;

    struct Guess { address player; string guess; }
    address private riddler;

    function () payable public {}
    
    constructor (string _riddle, bytes32 _answerHash) public payable {
        riddler = msg.sender;
        riddle = _riddle;
        answerHash = _answerHash;
        isActive = true;
    }

    function play(string guess) public payable {
        require(isActive);
        require(msg.value >= 0.3 ether);
        require(bytes(guess).length > 0);
        
        Guess newGuess;
        newGuess.player = msg.sender;
        newGuess.guess = guess;
        guesses.push(newGuess);
        
        if (keccak256(guess) == answerHash) {
            answer = guess;
            isActive = false;
            msg.sender.transfer(this.balance);
        }
    }
    
    function end(string _answer) public {
        require(msg.sender == riddler);
        answer = _answer;
        isActive = false;
        msg.sender.transfer(this.balance);
    }
}