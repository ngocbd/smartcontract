/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract SmartpoolVersion at 0x09077D92F7a71Ae3C4EAc8dC9f35cE9aa5A06F7B
*/
pragma solidity ^0.4.8;

contract SmartpoolVersion {
    address    public poolContract;
    bytes32    public clientVersion;
    
    mapping (address=>bool) owners;
    
    function SmartpoolVersion( address[3] _owners ) {
        owners[_owners[0]] = true;
        owners[_owners[1]] = true;
        owners[_owners[2]] = true;        
    }
    
    function updatePoolContract( address newAddress ) {
        if( ! owners[msg.sender] ) throw;
        
        poolContract = newAddress;
    }
    
    function updateClientVersion( bytes32 version ) {
        if( ! owners[msg.sender] ) throw;
        
        clientVersion = version;
    }
}