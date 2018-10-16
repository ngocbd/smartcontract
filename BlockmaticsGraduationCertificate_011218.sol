/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract BlockmaticsGraduationCertificate_011218 at 0x748cd48ac8e864868dc1ffb9a5c9badf957d1f67
*/
pragma solidity ^0.4.0;
contract BlockmaticsGraduationCertificate_011218 {
    address public owner = msg.sender;
    string certificate;
    bool certIssued = false;

    function publishGraduatingClass (string cert) public {
        assert (msg.sender == owner && !certIssued);

        certIssued = true;
        certificate = cert;
    }

    function showBlockmaticsCertificate() public constant returns (string) {
        return certificate;
    }
}