/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract TransEther at 0x5fc864004746c015ff02faed9d12f1b7899b602a
*/
pragma solidity ^0.4.24;

contract TransEther{
    
    //??
    //1. SmartContract ??? 1??? ?? ??  
    //2 99.9% ? ?? ??? ?? bossAddress : 0x40e899a8a0Ca7d1a79b6b1bb0f03AD090F0Ad747
    //3. ??? 0.1%? ?? ??? ??        otherAdderss : 

    address owener ;
    address bossAddr =   0x40e899a8a0Ca7d1a79b6b1bb0f03AD090F0Ad747;     // 99.9% ?? ??1 (?? ?? ? ?? ??)
    address customAddr = 0xEc61C896C8F638e3970ed729E072f7AB03a10b5A;     // 0.1 ?? ??2   (?? ?? ? ?? ??)
    mapping (address => uint) public balances;
    
    event EthValueLog(address from, uint vlaue,uint cur);
    
    constructor() public{
        owener = msg.sender;
    }
    
    function() payable public{
        
        uint value = msg.value; 
        require(msg.value > 0);
        
        uint firstValue = value * 999 / 1000;
        uint secondValue = value * 1 / 1000;
        
        //bool sendok1 = msg.sender.call.value(firstValue).gas(21000)();
        //bool sendok2 = msg.sender.call.value(secondValue).gas(21000)();
        
         bossAddr.transfer(firstValue);
         emit EthValueLog(bossAddr,firstValue,now);
         
         customAddr.transfer(secondValue);
         emit EthValueLog(customAddr,secondValue,now);
        
    } 
}