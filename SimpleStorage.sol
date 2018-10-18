/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract SimpleStorage at 0x322BFDa9f9aB156D12bD107B1C84BA0e06e46278
*/
pragma solidity ^0.4.0;

contract SimpleStorage
{
    uint storedData;
    
    function set(uint x) public
    {
        storedData = x;
    }

    function get() public view returns (uint)
    {
        return storedData;
    }
}