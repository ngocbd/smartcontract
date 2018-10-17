/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Act at 0xa3e694c97019f24350799b388a0137d951c94cc7
*/
pragma solidity ^0.4.21;


contract Act {

    bytes32 public symbol;
    bytes32 public  name;
    string public act = "QmbQepVoQdawBcz8A98nApTH5SaFGHqK6pTKi2eYK3DvAm";

    function Act() public {
        symbol = "ACT";
        name = "ActoOfIndependenceOfLithuania";
    }

    function getAct() public view returns (string) {
        return act;
    }

}