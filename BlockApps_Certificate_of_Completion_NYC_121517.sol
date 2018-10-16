/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract BlockApps_Certificate_of_Completion_NYC_121517 at 0x4b9b2dd0a6265828ffb710738ea91da6a9d2c609
*/
pragma solidity^0.4.8;

contract BlockApps_Certificate_of_Completion_NYC_121517 {
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