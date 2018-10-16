/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract wallet at 0x514ab9fb627de22542f9aa7e561980e46bf17272
*/
pragma solidity ^0.4.8;

contract wallet {
    address owner;
    function wallet() {
        owner = msg.sender;
    }
    function transfer(address target) payable {
        target.send(msg.value);
    }
    function kill() {
        if (msg.sender == owner) {
            suicide(owner);
        } else {
            throw;
        }
    }
}