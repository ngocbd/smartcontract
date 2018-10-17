/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Crowdsale at 0xa584c5eaccb5dd4a5c0fc0a785dee952becc4c06
*/
pragma solidity ^0.4.18;

interface token {
    function transfer(address receiver, uint amount) external;
}

contract Crowdsale {

    uint256 public price;
    token public tokenReward;
    address owner;
    uint256 public amount;

     modifier onlyCreator() {
        require(msg.sender == owner); // If it is incorrect here, it reverts.
        _;                              // Otherwise, it continues.
    } 
    
    constructor(address addressOfTokenUsedAsReward) public {
        owner = msg.sender;
        price = 0.00028 ether;
        tokenReward = token(addressOfTokenUsedAsReward);
    }
    
    function updateOwner(address newOwner) public onlyCreator{
        owner = newOwner;
    }

    function () payable public {

        amount = msg.value;
        uint256 tobesent = amount/price;
        tokenReward.transfer(msg.sender, tobesent*10e7);

    }

    function safeWithdrawal() public onlyCreator {
            uint amount = address(this).balance;
                owner.send(amount);
    }
}