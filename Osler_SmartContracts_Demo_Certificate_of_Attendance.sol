/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Osler_SmartContracts_Demo_Certificate_of_Attendance at 0x9e1b04460a5c3014d770a7e2bf7c55105c90749a
*/
// Note: 0.4.19 is a pre-release compiler, warning suggests use 0.4.18
// pragma solidity ^0.4.18;
contract Osler_SmartContracts_Demo_Certificate_of_Attendance {
  address public owner = msg.sender;
  string certificate;

  function publishLawyersInAttendance(string cert) {

    if (msg.sender !=owner){
      // return remainin gas back to  the caller
      revert();
    }
    certificate = cert;
  }
  function showCertificate() constant returns (string) {
    return certificate;
  }
}