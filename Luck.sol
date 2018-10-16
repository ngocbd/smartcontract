/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Luck at 0x790ef78af6a82b52c92a4082de66c8d3f49f21ad
*/
pragma solidity ^0.4.17;

contract Luck {
    uint32 public luck = 138;
    address public owner = 0x0;
    uint32[] public history;
    
    function Luck() public {
        owner = msg.sender;
    }
    
    function getLuck() public view returns(uint32) {
        return luck;
    }
    
    function changeLuck(uint32 newLuck) external payable {
        require(msg.sender == owner);
        history.push(luck);
        luck = newLuck;
    }
    
}