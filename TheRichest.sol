/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract TheRichest at 0x198889d1b8948a297048d85eb99d0b692c2a699d
*/
pragma solidity ^0.4.19;

contract TheRichest {
    address owner;
    
    address public theAddress;
    uint256 public theBid;

    function TheRichest() public {
        owner = msg.sender;
        theAddress = msg.sender;
        theBid = 1;
    }
    
    //pay to become theAddress with richest label
    function () public payable {
        if (msg.value > theBid) {
            theAddress = msg.sender;
            theBid = msg.value;
        }
    }
    
    // all money will go to dogcharity projects
    function gameOver() public {
        if (msg.sender == owner) {
          selfdestruct(owner);
        }
    }
    
}