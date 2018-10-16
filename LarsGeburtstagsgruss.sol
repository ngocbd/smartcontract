/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract LarsGeburtstagsgruss at 0xd16c735522daa367cef9336d8ee496391d81ea68
*/
pragma solidity ^0.4.15;

contract LarsGeburtstagsgruss {
    address owner;
    string gruss = "Alles Gute zum Geburtstag Lars! - Sören";
    string datum = "19.08.2017";

    function LarsGeburtstagsgruss() { 
        owner = msg.sender;
    }
    
    function greet() constant returns (string) {
        return gruss;
    }
    
    function kill() {
        if (msg.sender == owner) selfdestruct(owner);
    }
}