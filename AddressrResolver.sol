/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract AddressrResolver at 0x5a37ae1b841c0cd4c394d6c58c81c1a166f54053
*/
pragma solidity 0.4.24;


contract AddressrResolver {

    address public addr;
    
    address owner;
    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    
    constructor() public {
        owner = msg.sender;
    }
    
    function changeOwner(address newowner) external onlyOwner {
        owner = newowner;
    }
    
    function setAddr(address newaddr) external onlyOwner {
        addr = newaddr;
    }
    
}