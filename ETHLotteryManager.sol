/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract ETHLotteryManager at 0x0fd692e0d7629f169230c513a52934b70f1911bc
*/
pragma solidity ^0.4.15;

contract ETHLotteryManager {
    address public owner;
    address[] lottery_list;

    event Register(address _lottery);
    event Destroy();

    function ETHLotteryManager() {
        owner = msg.sender;
    }

    modifier isOwner() {
        // used tx.origin on purpose instead of
        // msg.sender, as we want to get the original
        // starter of the transaction to be owner
        require(tx.origin == owner);
        _;
    }

    function lotteries() constant returns (address[]) {
        return lottery_list;
    }

    function register() isOwner {
        lottery_list.push(msg.sender);
        Register(msg.sender);
    }

    function destruct() isOwner {
        Destroy();
        selfdestruct(owner);
    }
}