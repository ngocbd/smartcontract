/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract BusinessCardAM at 0xbdcebdf3a7e1227505cddc3063d3852aa9aee1e2
*/
pragma solidity ^0.4.13;

contract BusinessCardAM {
    
    mapping (bytes32 => string) variables;
    
    function setVar(string key, string value) {
        variables[sha3(key)] = value;
    }
    
    function getVar(string key) constant returns(string) {
        return variables[sha3(key)];
    }
}