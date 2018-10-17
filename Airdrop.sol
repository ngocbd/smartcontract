/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Airdrop at 0xF8EeefC666bB25d1693EdEa2c82A835a53712cD2
*/
pragma solidity ^0.4.23;

interface WAVEliteToken {
    
    function transfer(address to, uint256 value) external returns (bool);
}


contract Airdrop {
    
    address public owner;
    
    WAVEliteToken token;
   
    
    modifier onlyOwner() {
    	require(msg.sender == owner);
    	_;
  	}
    
    constructor() public {
      owner = msg.sender;
      token = WAVEliteToken(0x0a8c316420f8d27812beae70faa42f0522c868b1);
    }
    
    function send(address[] dests, uint256[] values) public onlyOwner returns(uint256) {
        uint256 i = 0;
        while (i < dests.length) {
            token.transfer(dests[i], values[i]);
            i += 1;
        }
        return i;
        
    }
    
    
}