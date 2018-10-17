/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Lottery at 0xfa75e2179039e1336602b39a91a565e512b5db3a
*/
pragma solidity ^0.4.21;

/// @title BlockchainCuties lottery
/// @author https://BlockChainArchitect.io
contract Lottery
{
    event Bid(address sender);

    function bid() public
    {
        emit Bid(msg.sender);
    }
}