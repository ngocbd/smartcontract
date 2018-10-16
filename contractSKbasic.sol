/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract contractSKbasic at 0x5b3c2581171eec91d104caf4572a4806d8c8380a
*/
pragma solidity 0.4.11;

contract contractSKbasic{
    
    string name1 = "Persona 1";
    string name2 = "Persona 2";
    uint date = now;
    
    function setContract(string intervener1, string intervener2){
        date = now;
        name1 = intervener1;
        name2 = intervener2;
    } 
    
    
    function getContractData() constant returns(string, string, uint){
        return (name1, name2, date) ;
    }
    
}