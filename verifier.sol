/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Verifier at 0xd4e0477de9c484cdb6c5b075477d40e60a90a713
*/
pragma solidity ^0.4.21;

contract Verifier {
    function recoverAddr(bytes32 msgHash, uint8 v, bytes32 r, bytes32 s) public pure returns (address msgAddress) {
        return ecrecover(msgHash, v, r, s);
    }
    
    function isSigned(address _addr, bytes32 msgHash, uint8 v, bytes32 r, bytes32 s) public pure returns (bool msgSigned) {
        return ecrecover(msgHash, v, r, s) == _addr;
    }
}