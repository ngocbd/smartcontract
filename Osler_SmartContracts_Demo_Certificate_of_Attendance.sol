/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Osler_SmartContracts_Demo_Certificate_of_Attendance at 0x43021fef65be5e09d8516ac2f14450993784479a
*/
// Note: 0.4.19 is a pre-release compiler, warning suggests use 0.4.18
// pragma solidity ^0.4.18;
contract Osler_SmartContracts_Demo_Certificate_of_Attendance {
  address public owner = msg.sender;
  string certificate;
  bool certIssued = false;

  function publishLawyersInAttendance(string cert) {

    if (msg.sender !=owner || certIssued){
      // return remainin gas back to  the caller
      revert();
    }
    certIssued = true;
    certificate = cert;
  }
  function showCertificate() constant returns (string) {
    return certificate;
  }
}