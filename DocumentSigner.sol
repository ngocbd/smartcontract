/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract DocumentSigner at 0xc7b7c5e882e5e255414eb18be25c0ac7e70ff308
*/
pragma solidity ^0.4.15;

contract DocumentSigner {
    mapping(string => address[]) signatureMap;
    
    function sign(string _documentHash) public {
        signatureMap[_documentHash].push(msg.sender);
    }

    function getSignatureAtIndex(string _documentHash, uint _index) public constant returns (address) {
    	return signatureMap[_documentHash][_index];
    }

    function getSignatures(string _documentHash) public constant returns (address[]) {
    	return signatureMap[_documentHash];
    }
}