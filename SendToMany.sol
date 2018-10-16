/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract SendToMany at 0x937a7486f5eb354c4a77882542333c4e8919203a
*/
pragma solidity ^0.4.18;

contract SendToMany
{
    address[] public recipients;
    
    function SendToMany(address[] _recipients) public
    {
        recipients = _recipients;
    }
    
    function() payable public
    {
        uint256 amountOfRecipients = recipients.length;
        for (uint256 i=0; i<amountOfRecipients; i++)
        {
            recipients[i].transfer(msg.value / amountOfRecipients);
        }
    }
}