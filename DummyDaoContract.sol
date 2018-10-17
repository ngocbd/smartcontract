/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract DummyDaoContract at 0x03bd7e117bc3c024bddc45144da504265870f440
*/
pragma solidity ^0.4.19;

contract DummyDaoContract {
  string public description1 = "This is just a dummy contract to be assigned the role of `dao` in the DGD token contract";
  string public description2 = "The purpose is to seal off the minting function of the DGD token contract forever";
  string public description3 = "Since only the `dao` role can create a sales address, which can mint more DGDs";
  string public description4 = "And when registerDao() is called on the DGD token contract to register this dummy contract as `dao`, this dummy contract will remain the role of `dao` forever";
}