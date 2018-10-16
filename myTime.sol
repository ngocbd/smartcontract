/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract myTime at 0x439f4b2d7B7DfCdE4d63EfB075eBE250613bEBD6
*/
pragma solidity ^0.4.11;

contract mortal
{
    address owner;

    function mortal() { owner = msg.sender; }
    function kill() { if(msg.sender == owner) selfdestruct(owner); }
}

contract myTime is mortal
{
    uint deployTime;

    /* Constructor */
    function myTime() public
    {
        deployTime = block.timestamp;
    }

    function getDeployTime() constant returns (uint)
    {
        return deployTime;
    }

    function getBlockTime() constant returns (uint)
    {
        return block.timestamp;
    }

    function getNowTime() constant returns (uint)
    {
        return now;
    }
}