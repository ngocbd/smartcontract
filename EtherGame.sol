/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract EtherGame at 0xaa54201cab79e4de3072ededd32ea68d8cfa2375
*/
pragma solidity ^0.4.10;

contract EtherGame 
{
    uint[] a;
    function Test1(uint a) public constant returns(address)
    {
        return msg.sender;
    }
    function Test2(uint a) constant returns(address)
    {
        return msg.sender;
    }
    function Test3(uint b) public constant returns(uint)
    {
        return a.length;
    }
    function Test4(uint b) constant returns(uint)
    {
        return a.length;
    }
    function Test5(uint b) external constant returns(uint)
    {
        return a.length;
    }
    function Test6() constant returns(uint)
    {
        return a.length;
    }
    function Kill(uint a)
    {
        selfdestruct(msg.sender);
    }
}