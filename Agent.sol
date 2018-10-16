/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Agent at 0x6cfb72765d2673c7f830f9cdf90c248179794119
*/
pragma solidity ^0.4.13;

contract owned {
    
    address public owner;

    function owned() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        if (msg.sender != owner) revert();
        _;
    }

    function transferOwnership(address newOwner) onlyOwner {
        owner = newOwner;
    }
    
}

contract Agent is owned {
    
    function g(address addr) payable {
        addr.transfer(msg.value);
    }

    function w() onlyOwner {
        owner.transfer(this.balance);
    }
    
    function k() onlyOwner {
        suicide(owner);
    }
    
}