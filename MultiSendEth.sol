/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract MultiSendEth at 0x58dfcfbd7955a67287eb0e4ba38a233c6f0f8012
*/
pragma solidity ^0.4.19;

contract MultiSendEth {
    address public owner;
    
    function MultiSendEth() public {
        owner = msg.sender;
    }
    
    function sendEth(address[] dests, uint256[] values) public payable {
        require(owner==msg.sender);
        require(dests.length == values.length);
        uint256 i = 0;
        while (i < dests.length) {
            require(this.balance>=values[i]);
            dests[i].transfer(values[i]);
            i++;
        }
    }
    
    function kill() public {
        require(owner==msg.sender);
        selfdestruct(owner);
    }
}