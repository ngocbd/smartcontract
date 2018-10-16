/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Vault at 0x85bb5ed8bff03ae5dfd5c173ee0874e2070b151a
*/
pragma solidity ^0.4.8;

contract Token {
    function balanceOf(address) public constant returns (uint);
    function transfer(address, uint) public returns (bool);
}

contract Vault {
    Token constant public token = Token(0xa645264C5603E96c3b0B078cdab68733794B0A71);
    address constant public recipient = address(0x70f7F70E3E7497a2dbEA5a47010010be447483b9);
    // UNIX timestamp
    uint256 constant public unlockedAt = 1515600000;
    
    function unlock() public {
        if (now < unlockedAt) throw;
        uint vaultBalance = token.balanceOf(address(this));
        if (!token.transfer(recipient, vaultBalance)) throw;
    }
}