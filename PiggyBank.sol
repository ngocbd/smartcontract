/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract PiggyBank at 0x0b4ABe9E916E9c00CC80C4c473386D1116d5Bd8E
*/
pragma solidity ^0.4.11;

contract PiggyBank
{
    address creator;
    uint deposits;
    uint unlockTime;

    /* Constructor */
    function PiggyBank() public
    {
        creator = msg.sender;
        deposits = 0;
        unlockTime = now + 5 minutes;
    }

    function() payable
    {
        deposit();
    }

    function deposit() payable returns (uint)
    {
        if( msg.value > 0 )
            deposits = deposits + 1;

        return getNumberOfDeposits();
    }

    function getNumberOfDeposits() constant returns (uint)
    {
        return deposits;
    }

    function getUnlockTime() constant returns (uint)
    {
        return unlockTime;
    }

    function kill()
    {
        if( msg.sender == creator && now >= unlockTime )
            selfdestruct(creator);
    }
}