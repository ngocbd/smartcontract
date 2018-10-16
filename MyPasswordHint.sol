/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract MyPasswordHint at 0xB02bD126cd5477b2C166f8A31fAb75DB0c074371
*/
pragma solidity 0.4.8;

contract MyPasswordHint {
    string public hint;
    address public owner;
    /* Constructor */
    function MyPasswordHint() {
        hint = "";
        owner = msg.sender;
    }
    function setHint(string nHint) {
        if (msg.sender == owner) {
            hint = nHint;
        }
    }
    function kill() {
        if (msg.sender == owner) {
            selfdestruct(owner);
        }
    }
}