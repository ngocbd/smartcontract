/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract BlockApps_Certificate_of_Completion at 0xfa1f4e5eb0cd3eb332c47268070630a20dd73986
*/
pragma solidity^0.4.8;
contract BlockApps_Certificate_of_Completion {
    address public owner = msg.sender;
    string certificate;
    bool certIssued = false;
    function publishGraduatingClass(string cert) {
        if (msg.sender != owner || certIssued)
            throw;
        certIssued = true;
        certificate = cert;
    }
    function showCertificate() constant returns (string) {
        return certificate;
    }
}