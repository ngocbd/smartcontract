/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract EmailRegistry at 0x20c576c6a2a706c8d15639d58038d94f9010971d
*/
pragma solidity ^0.4.18; // solhint-disable-line



contract EmailRegistry {
    mapping (address => string) public emails;
    function registerEmail(string email){
        emails[msg.sender]=email;    
    }
}