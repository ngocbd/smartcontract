/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract BlockmaticsGraduationCertificate at 0x60a76ea79eBC7264F2897EE7FE4f33F31ef25A74
*/
pragma solidity ^0.4.2;
contract BlockmaticsGraduationCertificate {
    address public owner = msg.sender;
    string certificate;
    bool certIssued = false;


    function publishGraduatingClass(string cert) {
        if (msg.sender != owner || certIssued)
            throw;
        certIssued = true;
        certificate = cert;
    }


    function showBlockmaticsCertificate() constant returns (string) {
        return certificate;
    }
}