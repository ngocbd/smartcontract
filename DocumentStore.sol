/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract DocumentStore at 0x1bca2e699d0eefbf1dde6c6c8d6138db119f99bd
*/
pragma solidity 0.4.19;

contract DocumentStore {

    event Store(bytes32 indexed document, bytes32 indexed party1, bytes32 indexed party2);

    function store(bytes32 document, bytes32 party1, bytes32 party2) public {
        Store(document, party1, party2);
    }
}