/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract CryptoPeopleName at 0x4b5cd619741838cb3442831c3f268a78b7df859a
*/
pragma solidity ^0.4.13;

contract CryptoPeopleName {
    address owner;
    mapping(address => string) private nameOfAddress;
  
    function CryptoPeopleName() public{
        owner = msg.sender;
    }
    
    function setName(string name) public {
        nameOfAddress[msg.sender] = name;
    }
    
    function getNameOfAddress(address _address) public view returns(string _name){
        return nameOfAddress[_address];
    }
    
}