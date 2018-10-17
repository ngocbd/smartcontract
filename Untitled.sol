/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Untitled at 0xd74e47e0dc54736af520d4e8a5423f25c9769024
*/
pragma solidity ^0.4.23;

contract Untitled {
    
    event Buy(address indexed beneficiary, uint256 payedEther, uint256 tokenAmount);
    
    function test(string nothing) public returns(string hello) {
        emit Buy(msg.sender, now, now + 36000);
        hello = nothing;
    }
}