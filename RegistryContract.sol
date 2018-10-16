/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract RegistryContract at 0x81E3354BcB0A086484bCA2F0D80BB2a19232F34c
*/
pragma solidity ^0.4.0;

contract RegistryContract {
    
    struct record {
       uint timestamp;
       string info;
    }
    
    mapping (uint => record) public records;
   
    address owner;
   
   
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
   
   
   
    function RegistryContract() {
       owner = msg.sender;
    }
    
    function transferOwnership(address newOwner) public onlyOwner {
        owner = newOwner;
    }
    
    function put(uint _uuid, string _info) public onlyOwner {
        require(records[_uuid].timestamp == 0);
        records[_uuid].timestamp = now;
        records[_uuid].info = _info;
    }
    
    function getInfo(uint _uuid) public returns(string) {
        return records[_uuid].info;
    }
    
    function getTimestamp(uint _uuid) public returns(uint) {
        return records[_uuid].timestamp;
    }
    
}