/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract myTime at 0x3c45122a41d36b3fff486442d02e9db2cc33cbe6
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

    function getDeploytimeBlocktimeBlocknumber() constant returns (uint, uint, uint)
    {
        return (deployTime, block.timestamp, block.number);
    }

}