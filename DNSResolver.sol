/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract DNSResolver at 0x2807e558a7eba8d25c3a05a0e7e9a6a437a6e6a4
*/
pragma solidity ^0.4.0;

contract Resolver {
    function supportsInterface(bytes4 interfaceID) constant returns (bool);
    function dnsrr(bytes32 node) constant returns (bytes data);
}

contract DNSResolver is Resolver {
    address public owner;
    mapping(bytes32=>bytes) zones;
    
    function OwnedResolver() {
        owner = msg.sender;
    }
    
    modifier owner_only {
        if(msg.sender != owner) throw;
        _;
    }
    
    function supportsInterface(bytes4 interfaceID) constant returns (bool) {
        return interfaceID == 0x126a710e;
    }
    
    function dnsrr(bytes32 node) constant returns (bytes data) {
        return zones[node];
    }
    
    function setDnsrr(bytes32 node, bytes data) owner_only {
        zones[node] = data;
    }
}