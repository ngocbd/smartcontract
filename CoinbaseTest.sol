/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract CoinbaseTest at 0x9f5c26cf678f9ab05f61238fae440621bae611de
*/
pragma solidity 0.4.24;
contract CoinbaseTest {
    address owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    function () public payable {
    }
    
    function withdraw() public {
        require(msg.sender == owner);
        msg.sender.transfer(this.balance);
    }

}