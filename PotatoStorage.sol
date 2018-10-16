/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract PotatoStorage at 0xc50ba8ee9fc19912216731b9170d5bdfc28067f6
*/
pragma solidity ^0.4.0;

contract PotatoStorage {
    string storedPotato;

    function setPotato(string x) public {
        storedPotato = x;
    }

    function getPotato() public view returns (string) {
        return storedPotato;
    }
}