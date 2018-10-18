/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract WannabeSmartInvestor at 0x55aa079e2fb0c8b68a0a08efbff3f1aa5472f1a2
*/
pragma solidity ^0.4.21;

contract WannabeSmartInvestor {
    
    address private owner;
    mapping(address => uint) public incomeFrom;

    constructor() public {
        owner = msg.sender;
    }
    
    function invest(address _to, uint _gas) public payable {
        require(msg.sender == owner);
        require(_to.call.gas(_gas).value(msg.value)());
    }
    
    function withdraw() public {
        require(msg.sender == owner);
        owner.transfer(address(this).balance);
    }

    function () public payable {
        incomeFrom[msg.sender] = incomeFrom[msg.sender] + msg.value;
    }     

}