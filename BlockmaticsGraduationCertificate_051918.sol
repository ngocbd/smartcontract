/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract BlockmaticsGraduationCertificate_051918 at 0xec5dd1cac81dea46c224618fc4c5c346968eae0c
*/
pragma solidity ^0.4.18;
contract BlockmaticsGraduationCertificate_051918 {
    address public owner = msg.sender;
    string public certificate;
    bool public certIssued = false;

    function publishGraduatingClass (string cert) public {
        assert (msg.sender == owner && !certIssued);

        certIssued = true;
        certificate = cert;
    }
}