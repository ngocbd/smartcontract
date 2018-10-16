/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract SmartVerifying at 0x8c1a31a6e954f989a06fcee1067d426d70891ce9
*/
contract SmartVerifying{
    function SmartVerifying(){

    }

    function() payable
    {
        if(msg.sender.send(msg.value)==false) throw;
    }
}