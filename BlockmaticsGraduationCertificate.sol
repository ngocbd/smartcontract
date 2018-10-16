/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract BlockmaticsGraduationCertificate at 0x4C2C4511BA8F5B5f356ADF7eaeBCE8dD2ea9a9c6
*/
pragma solidity ^0.4.0;
contract BlockmaticsGraduationCertificate {
    address public owner = msg.sender;
    string certificate;


    function publishGraduatingClass(string cert) {
        if (msg.sender != owner)
            throw;
        certificate = cert;
    }


    function showBlockmaticsCertificate() constant returns (string) {
        return certificate;
    }
}