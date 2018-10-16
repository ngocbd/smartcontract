/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Blockmatics_Certificate_12142017 at 0xb89debadd9421ef3851daa0e4bb0ba4cb73280f9
*/
pragma solidity ^0.4.6;

contract Blockmatics_Certificate_12142017 {
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