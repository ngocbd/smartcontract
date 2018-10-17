/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Hasher at 0xb6e6697ac077cf34db3f843dd7d4a4d9372d62de
*/
pragma solidity ^0.4.24;
contract Hasher{
    function hashLoop(uint numTimes, bytes32 dataToHash) public returns (bytes32){
        for(uint i = 0 ; i < numTimes ; i++){
            dataToHash = keccak256(abi.encodePacked(dataToHash));
        }
        return dataToHash;
    }
}