/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract BlockmaticsGraduationCertificate_022218 at 0x9c00dae00e62abeebc6496c1c41e4f63816ffa9f
*/
pragma solidity ^0.4.5;
contract BlockmaticsGraduationCertificate_022218 {
    address public owner = msg.sender;
    string public certificate;
    bool public certIssued = false;

    function publishGraduatingClass(string cert) public {
        require (msg.sender == owner && !certIssued);
        certIssued = true;
        certificate = cert;
    }
}