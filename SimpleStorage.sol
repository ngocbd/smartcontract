/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract SimpleStorage at 0x9295ede03f6eab5c8f215d3ddcf7dca3a26ca087
*/
pragma solidity ^0.4.0;

contract SimpleStorage {
    uint storedData;

    function set(uint x) {
        storedData = x;
    }

    function get() constant returns (uint storedData) {
        return storedData;
    }
}