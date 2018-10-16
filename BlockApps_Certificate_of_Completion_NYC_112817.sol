/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract BlockApps_Certificate_of_Completion_NYC_112817 at 0x67685918e81814a87e1eeef82f4c9083cfc10c94
*/
pragma solidity^0.4.8;

contract BlockApps_Certificate_of_Completion_NYC_112817 {
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