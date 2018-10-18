/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract BlockmaticsGraduationCertificate_092818 at 0x3bab34ac9de2670b05b41df314a6c50d4ef3a05a
*/
contract BlockmaticsGraduationCertificate_092818 {
    address public owner = msg.sender;
    string public certificate;
    bool public certIssued = false;

    function publishGraduatingClass (string cert) public {
        assert (msg.sender == owner && !certIssued);

        certIssued = true;
        certificate = cert;
    }
}