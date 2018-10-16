/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract HashRegistry at 0x6EbA23a90Fd0ce5eF120bBe249A96038B2be5e29
*/
pragma solidity ^0.4.16;

// a naive implementation of hash registry

contract HashRegistry {
    
    struct StoredIn {
        uint storageId;
        address storedBy; 
    }
    
    mapping(uint => StoredIn) storeMap;
    string[] storageNames;
    
    function store(uint hash, uint storageId) public {
        address storedBy = storeMap[hash].storedBy;  
        require(storedBy == 0 || storedBy == msg.sender);
        require(storageId < storageNames.length);
        storeMap[hash] = StoredIn(storageId, msg.sender);
    }
    
    
    function addStorage(string storageName) public {
        //ToDo: check existing storageNames to prevent duplicates
        storageNames.push(storageName);
    }
    
}