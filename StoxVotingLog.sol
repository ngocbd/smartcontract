/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract StoxVotingLog at 0x9ba742f3a158ec4f7b317270037716cc84aafec1
*/
pragma solidity ^0.4.25;

contract StoxVotingLog {
    
    event LogVotes(address _voter, uint sum);

    constructor() public {}

    function logVotes(uint sum)
        public
        {
            emit LogVotes(msg.sender, sum);
        }

}