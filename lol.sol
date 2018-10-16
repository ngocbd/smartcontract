/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract lol at 0x212590b04bfc83befc4b88bb3ecbc4f1446e15f4
*/
contract lol{
        address private admin;
        function lol() {
            admin = msg.sender;
        }
        modifier onlyowner {if (msg.sender == admin) _  }
function recycle() onlyowner
{
        //Destroy the contract
        selfdestruct(admin);
    
}
}