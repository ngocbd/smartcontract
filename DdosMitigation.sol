/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract DdosMitigation at 0x62854fc64d74b7eb5e4d0a2910e277ffb4d3d1e3
*/
pragma solidity 0.4.8;

contract DdosMitigation {
    struct Report {
        address reporter;
        bytes32 ipAddress;
    }

    address public owner;
    Report[] public reports;

    function DdosMitigation() {
        owner = msg.sender;
    }

    function report(bytes32 ipAddress) {
        reports.push(Report({
            reporter: msg.sender,
            ipAddress: ipAddress
        }));
    }
}