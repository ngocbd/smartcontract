/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract contractSKbasic at 0xd2fB71FbD065157B70268eB13a6d7f8F11e10857
*/
pragma solidity 0.4.11;

contract contractSKbasic{

    string name1 = "Persona 1";
    string name2 = "Persona 2";
    uint date = now;

    function setContractSK(string intervener1, string intervener2){
        date = now;
        name1 = intervener1;
        name2 = intervener2;
    }


    function getContractDataSK() constant returns(string, string, uint){
        return (name1, name2, date) ;
    }

}