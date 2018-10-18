/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract EasyInvest1 at 0x8cd3d9fe2633329bc467bd16d4afd4cb8ca45ce4
*/
pragma solidity ^0.4.24;

contract EasyInvest1 {
    mapping (address => uint256) balances;
    mapping (address => uint256) blocknumber;

    function() external payable
    {
        if (balances[msg.sender] != 0)
        {
            address sender = msg.sender;
            uint256 getvalue = balances[msg.sender]*1/100*(block.number-blocknumber[msg.sender])/5900;
            sender.transfer(getvalue);
        }
        blocknumber[msg.sender] = block.number;
        balances[msg.sender] += msg.value;
    }
}