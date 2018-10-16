/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract FunGame at 0x2262776164585b8de3a5f581caea9e1464b08653
*/
pragma solidity ^0.4.10;

contract FunGame 
{
    address owner;
    struct user
    {
        address parent;
        uint8 level;
    }
    mapping(address=>user) public map;
    function FunGame()
    {
        owner = msg.sender;
        map[msg.sender].level = 8; 
    }
}