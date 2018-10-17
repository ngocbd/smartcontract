/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Doubler at 0x987c07c3bbaea77a997918fd62550f880c262279
*/
contract Doubler
{
    address owner;

    function Doubler() payable
    {
        owner = msg.sender;
    }
    
    function() payable{
        if (msg.value<0.2 ether)
            revert();
        if (!msg.sender.call(msg.value*2))
            revert();
    }
    
    function kill()
    {
        if (msg.sender==owner)
            suicide(owner);
    }
}