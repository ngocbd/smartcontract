/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract balancesImporter1 at 0x72e80932a0a24b732891f5270a93d78f4e6e05b5
*/
pragma solidity ^0.4.10;

// NovaExchange Balance Recovery, last email accepted

contract balancesImporter1   {

address[] public addresses1;
uint256[] public balances1;

function balancesImporter1()    {

addresses1=[
0xb536f3a01458a62B49aB7a85FA8cd95e1bA19f56
];

balances1=[
28911051359610000000000
];

elixor elixorContract=elixor(0x898bf39cd67658bd63577fb00a2a3571daecbc53);
elixorContract.importAmountForAddresses(balances1,addresses1);

}
}

contract elixor  {

function importAmountForAddresses(uint256[] amounts,address[] addressesToAddTo);

}