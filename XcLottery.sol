/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract XcLottery at 0xeb61a78f06fc606d82892a38ea581c2bb7f82570
*/
pragma solidity ^0.4.19;

contract Ownable {
	address public owner;
	function Ownable() {owner = msg.sender;}
	modifier onlyOwner() {
		if (msg.sender != owner) throw;
		_;
	}

}

contract XcLottery is Ownable{
    
    mapping (string => uint256) randomSeedMap;
    
    event DrawLottery(string period, uint256 randomSeed);
    
    function getRandomSeed(string period) constant returns (uint256 randomSeed) {
        return randomSeedMap[period];
    }
    
    function drawLottery(string period) onlyOwner {
        if(randomSeedMap[period] != 0) throw;
        var lastblockhashused = block.blockhash(block.number - 1);
        uint256 randomSeed = uint256(sha3(block.difficulty, block.coinbase, now, lastblockhashused, period));
        randomSeedMap[period] = randomSeed;
        DrawLottery(period,randomSeed);
    }
    
    // Do not allow direct deposits.
    function () external {
        throw;
    }
}