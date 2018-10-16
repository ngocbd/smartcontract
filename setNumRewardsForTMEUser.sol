/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract setNumRewardsForTMEUser at 0x387bcd322bec21d73d7ce1a8eb9a8bfd9c91cc01
*/
pragma solidity ^0.4.10;

// Requested by person who made all their TME batches after snapshot.

contract setNumRewardsForTMEUser    {

function setNumRewardsForTMEUser()    {

elixor elixorContract=elixor(0x898bf39cd67658bd63577fb00a2a3571daecbc53);
elixorContract.manuallySetNumRewardsAvailableForChildAddress(0x59d2d2a10c1c86367a88e35f0ef4c2fbba918471,10);

}
}

contract elixor  {

function manuallySetNumRewardsAvailableForChildAddress(address owner,uint256 numRewardsAvail);

}