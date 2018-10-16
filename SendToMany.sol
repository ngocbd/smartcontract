/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract SendToMany at 0x70e531091d82e183f7246012d1566c3fe1315625
*/
pragma solidity ^0.4.18;

contract SendToMany
{
    address owner;
    
    address[] public recipients;
    
    function SendToMany() public
    {
        owner = msg.sender;
    }
    
    function setRecipients(address[] newRecipientsList) public
    {
        require(msg.sender == owner);
        
        recipients = newRecipientsList;
    }
    
    function addRecipient(address newRecipient) public
    {
        recipients.push(newRecipient);
    }
    
    function sendToAll(uint256 amountPerRecipient) payable public
    {
        for (uint256 i=0; i<recipients.length; i++)
        {
            recipients[i].transfer(amountPerRecipient);
        }
    }
}