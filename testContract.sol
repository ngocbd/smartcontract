/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract TestContract at 0x03ab37e5754f55c965101ba1623b3bc91e819b28
*/
pragma solidity ^0.4.0;
contract TestContract {
    string name;
    function getName() public constant returns (string){
        return name;
    }
    function setName(string newName) public {
        name = newName;
    }
}