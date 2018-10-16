/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract stopScamHolder at 0xe5975de205854b3a913b7cb157b7c1ef6f500336
*/
pragma solidity ^0.4.13;

contract token { 
    function transfer(address _to, uint256 _value);
    function balanceOf(address _owner) constant returns (uint256 balance);
}

contract stopScamHolder {
    
    token public sharesTokenAddress;
    address public owner;
    uint public endTime = 1510664400;////10 symbols
    uint256 public tokenFree;

modifier onlyOwner() {
    require(msg.sender == owner);
    _;
}

function stopScamHolder(address _tokenAddress) {
    sharesTokenAddress = token(_tokenAddress);
    owner = msg.sender;
}

function tokensBack() onlyOwner public {
    if(now > endTime){
        sharesTokenAddress.transfer(owner, sharesTokenAddress.balanceOf(this));
    }
    tokenFree = sharesTokenAddress.balanceOf(this);
}	

}