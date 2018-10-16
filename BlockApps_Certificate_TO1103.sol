/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract BlockApps_Certificate_TO1103 at 0x6a18594a531d9e8d951062b6a5592b8350f764c8
*/
pragma solidity^0.4.8;

contract BlockApps_Certificate_TO1103 {
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