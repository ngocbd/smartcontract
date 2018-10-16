/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract BlockmaticsGraduationCertificate_030518 at 0xd532550b23b5a9ac9a230280518818f209db95d1
*/
pragma solidity ^0.4.18;
contract BlockmaticsGraduationCertificate_030518 {
    address public owner = msg.sender;
    string public certificate;
    bool public certIssued = false;

    function publishGraduatingClass (string cert) public {
        assert (msg.sender == owner && !certIssued);

        certIssued = true;
        certificate = cert;
    }
}