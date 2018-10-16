/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract BlockApps_Blockmatics_Certificate_12142017 at 0x59c9d35c264beefe98380a559e289d4fc98753e7
*/
pragma solidity ^0.4.6;

contract BlockApps_Blockmatics_Certificate_12142017 {
    address public owner = msg.sender;
    string certificate;
    bool certIssued = false;

    function publishGraduatingClass(string cert) public {
        if (msg.sender != owner || certIssued)
            revert();
        certIssued = true;
        certificate = cert;
    }

    function showCertificate() constant public returns (string)  {
        return certificate;
    }
}