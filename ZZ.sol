/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract ZZ at 0x8d079274b7016384859Ef11f045A07800E99Faa9
*/
pragma solidity ^0.4.19;

contract ZZ
{
    address creator;
    function ZZ() public payable {
        creator = msg.sender;
    }

    function getMessage() public pure returns (bytes32) {
        return "ZZ loves mandy.";
    }
  
    function e() public { 
        if (msg.sender == creator)
            selfdestruct(creator);
    }
}