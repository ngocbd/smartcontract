/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Numa at 0x0bec4767cd170242895d244d7ff73feaff6c2598
*/
pragma solidity ^0.4.2;

contract Numa {

    event NewBatch(
        bytes32 indexed ipfsHash
    );

    function Numa() public { }
    
    function newBatch(bytes32 ipfsHash) public {
        NewBatch(ipfsHash);
    }
}