/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract MultiEthSender at 0x4BE2983B8C77316aaB2A73f7be66Eb7B15EC2ae1
*/
pragma solidity ^0.4.0;

contract MultiEthSender {
    
    event Send (
        uint256 _amount,
        address indexed_receiver
    );

    function multiSendEth(uint256 amount, address[] list) public returns (bool) {
        uint listLength = list.length;
        for (uint i=0; i<listLength; i++) {
            list[i].transfer(amount);
            emit Send(amount, list[i]);
        }
        
        return true;
    }
    
    function () external payable {}

}