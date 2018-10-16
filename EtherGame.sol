/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract EtherGame at 0x8a630b2d1e25f1ad066feaa090f5bdb63a1451cc
*/
pragma solidity ^0.4.10;

contract EtherGame 
{
    uint[] a;
    function Test1() public returns(address)
    {
        return msg.sender;
    }
    function Test2() returns(address)
    {
        return msg.sender;
    }
    function Test3() public returns(uint)
    {
        return a.length;
    }
    function Test4() returns(uint)
    {
        return a.length;
    }
    function Kill()
    {
        selfdestruct(msg.sender);
    }
}