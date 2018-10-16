/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract minishop at 0x5f525907032d5e6b4c6d855ee3ae6a0cdf90a3da
*/
pragma solidity ^0.4.18;

contract minishop{
    
    event Buy(address indexed producer, bytes32 indexed productHash, address indexed buyer);
    
    function buy(address _producer, bytes32 _productHash) public
    {
        emit Buy(_producer, _productHash, msg.sender);
    }
    
}