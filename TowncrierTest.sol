/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract TowncrierTest at 0x2f90a5202ec023fc5015d063dae1e64d18063506
*/
pragma solidity ^0.4.0;
contract TowncrierTest {
    event LogTowncrierCallback(uint64 requestId, uint64 error, bytes32 respData);
    
    function towncrierCallback(uint64 requestId, uint64 error, bytes32 respData) public {
        LogTowncrierCallback(requestId, error, respData);
    }
}