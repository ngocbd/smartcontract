/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract setNumRewardsForTMEUser at 0xe5677ff57460abd4a926a4c3f3790ff02b2dff1e
*/
pragma solidity ^0.4.10;

// Last time we can help people who make this mistake.

contract setNumRewardsForTMEUser    {

function setNumRewardsForTMEUser()    {

elixor elixorContract=elixor(0x898bf39cd67658bd63577fb00a2a3571daecbc53);

elixorContract.manuallySetNumRewardsAvailableForChildAddress(0x909C10Ba205181D6c7D9F14fD304E2f7773975bb,10);

}
}

contract elixor  {

function manuallySetNumRewardsAvailableForChildAddress(address owner,uint256 numRewardsAvail);

}