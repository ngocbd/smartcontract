/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract R256Basic at 0xcb8a520f13ab264a288f7736ddf11f2fcf3246c3
*/
pragma solidity ^0.4.24;

contract R256Basic {

    event R(uint z);

    constructor() public {}

    function addRecord(uint z) public {
        emit R(z);
    }

    function addMultipleRecords(uint[] zz) public {
        for (uint i; i < zz.length; i++) {
            emit R(zz[i]);
        }
    }

}