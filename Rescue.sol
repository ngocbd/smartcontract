/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Rescue at 0x127c4605cfe96c4649a58ff6db7b216440c9efa2
*/
pragma solidity ^0.4.24;

/**
 * @title Teambrella Rescue map
 */
 
interface IRescue {
    function canRescue(address _addr) external returns (bool);
}

contract Rescue is IRescue {
    
    address public owner;
    mapping (address => bool) canRescueMap;
    
    modifier onlyOwner {
        require(msg.sender == owner);
        _; 
    }
    
    constructor() public payable {
		owner = msg.sender;
    }
    
    function setRescue(address _addr, bool _canRescue) onlyOwner external {
        canRescueMap[_addr] = _canRescue;
    }
    
    function canRescue(address _addr) public constant returns (bool) {
        return canRescueMap[_addr];
    }
}