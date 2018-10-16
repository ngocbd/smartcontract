/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract AndxorLogger at 0x5a22c6597a71ed1510177ac9d9cf900a283b6197
*/
pragma solidity ^0.4.0;

/// @title Andxor hash logger
/// @author Andxor Soluzioni Informatiche srl <http://www.andxor.it/>
contract AndxorLogger {
    event LogHash(uint256 hash);

    function AndxorLogger() {
    }

    /// logs an hash value into the blockchain
    function logHash(uint256 value) {
        LogHash(value);
    }
}