/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract FunGame at 0xdd9734d041637868bbcdc963b0cea2db77dca3a7
*/
pragma solidity ^0.4.10;

contract FunGame 
{
    address owner;
    modifier OnlyOwner() 
    {
        if (msg.sender == owner) 
        _;
    }
    function FunGame()
    {
        owner = msg.sender;
    }
    function TakeMoney() OnlyOwner
    {
        owner.transfer(this.balance);
    }
    function ChangeOwner(address NewOwner) OnlyOwner 
    {
        owner = NewOwner;
    }
}