/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Agent at 0x70eb907cb2c51bda4e199f54d4c21b97676bb451
*/
pragma solidity ^0.4.13;

contract Agent {
    
    function g(address addr) payable {
        addr.transfer(msg.value);
    }

}