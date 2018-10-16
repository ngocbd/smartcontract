/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract TSQ at 0xecfdd60b5c5569262edd1a98212623ce3e99be1f
*/
pragma solidity ^0.4.0;

contract TSQ {

    address public jak;
    bool public is_open = true;

    function TSQ() {
        jak = msg.sender;
    }

    function open() {
        if (msg.sender != jak) return;
        is_open = true;
    }

    function close() {
        if (msg.sender != jak) return;
        is_open = false;
    }
}