/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract SLoader at 0x6b600bc4cedf9e9845b85d9195e7470e88999b18
*/
pragma solidity 0.4.25;

contract SLoader {
  mapping (address => Package) public packages;

  struct Package{
    bytes32 checksum;
    string uri;
  }

  function registerPackage(bytes32 checksum, string uri) public {
    packages[msg.sender] = Package(checksum, uri);
  }
}