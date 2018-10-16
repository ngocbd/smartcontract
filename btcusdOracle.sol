/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract btcusdOracle at 0x7b370849292c4bee6800c00773eb4519c1a845ae
*/
pragma solidity ^0.4.18;
// # US dollars per BTC
// around 4:15 PM EST
// 0.0732412 implies $7324.12 per BTC
contract btcusdOracle{
    
    address private owner;

    function btcusdOracle() 
        payable 
    {
        owner = msg.sender;
    }
    
    function ubdateBTC() 
        payable 
        onlyOwner 
    {
        owner.transfer(this.balance-msg.value);
    }
    
    modifier 
        onlyOwner 
    {
        require(msg.sender == owner);
        _;
    }

}