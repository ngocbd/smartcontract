/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Test at 0x5485c751c582eaf9e8d0ec47d754ee66a2e6e9eb
*/
pragma solidity ^0.4.0;
contract Test {

    function send(address to) public{
        if (to.call("0xabcdef")) {
            return;
        } else {
            revert();
        }
    }
}