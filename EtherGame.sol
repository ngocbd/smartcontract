/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract EtherGame at 0x49d2374241a0a4b407a71d359a753fc630c5d8d4
*/
pragma solidity ^0.4.10;

contract EtherGame 
{
    uint[] a;
    function Test1(uint a) public returns(address)
    {
        return msg.sender;
    }
    function Test2(uint a) returns(address)
    {
        return msg.sender;
    }
    function Test3(uint b) public returns(uint)
    {
        return a.length;
    }
    function Test4(uint b) returns(uint)
    {
        return a.length;
    }
    function Kill(uint a)
    {
        selfdestruct(msg.sender);
    }
}