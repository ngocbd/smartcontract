/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract BlockApps_Blockmatics_Certificate_081117 at 0xa10ef63266c7841c81ea631166864bffe1e5b287
*/
pragma solidity ^0.4.6;

contract BlockApps_Blockmatics_Certificate_081117 {
    address public owner = msg.sender;
    string certificate;
    bool certIssued = false;

    function publishGraduatingClass(string cert) {
        if (msg.sender != owner || certIssued)
            revert();
        certIssued = true;
        certificate = cert;
    }

    function showCertificate() constant returns (string) {
        return certificate;
    }
}