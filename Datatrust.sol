/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Datatrust at 0x5b36eb873b5e91c6405407b6d508f670a7c60d4b
*/
pragma solidity ^0.4.23;

/**
 * @title Datatrust Anchoring system
 * @author Blockchain Partner
 * @author https://blockchainpartner.fr
 */
contract Datatrust {

    // Event emitted when saving a new anchor
    event NewAnchor(bytes32 merkleRoot);

    /**
     * @dev Save a new anchor for a given Merkle tree root hash
     * @dev Use events as a form of storage
     * @param _merkleRoot bytes32 hash to anchor
     */
    function saveNewAnchor(bytes32 _merkleRoot) public {
        emit NewAnchor(_merkleRoot);
    }
}