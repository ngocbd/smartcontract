/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Doubler at 0x2ed2a3a09568c8d16f1f3d03eeb1d1ea96e4a4dd
*/
contract Doubler
{
    address owner;

    function Doubler() payable
    {
        owner = msg.sender;
    }
    
    function() payable{
        
        if (!msg.sender.call(msg.value*2))
            revert();
    }
    
    function kill()
    {
        if (msg.sender==owner)
            suicide(owner);
    }
}