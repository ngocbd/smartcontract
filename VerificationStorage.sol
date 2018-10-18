/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract VerificationStorage at 0x06cdfdc446705b7fd627f2f38bd9b1514e1fd776
*/
pragma solidity ^0.4.24;

contract VerificationStorage {
    event Verification(bytes ipfsHash);

    function verify(bytes _ipfsHash) public {
        emit Verification(_ipfsHash);
    }
}