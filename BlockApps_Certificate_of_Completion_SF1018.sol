/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract BlockApps_Certificate_of_Completion_SF1018 at 0x7945b57550d6a3deac9f976aea891c6f0323a103
*/
pragma solidity^0.4.8;
contract BlockApps_Certificate_of_Completion_SF1018 {
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