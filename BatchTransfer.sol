/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract BatchTransfer at 0xaa47a80f116cab5b4f03d37bcc06ac4dd4592056
*/
pragma solidity ^0.4.24;

contract ERC20Interface {
    function transferFrom(address from, address to, uint tokens) public returns (bool success);
}

contract BatchTransfer {
    function transfer(address tokenAddress, address[] to, uint[] tokens) public returns (bool success) {
        require(to.length > 0);
        require(to.length <= 100);
        require(to.length == tokens.length);
        for (uint8 i = 0; i < to.length; i++) {
            ERC20Interface(tokenAddress).transferFrom(msg.sender, to[i], tokens[i]);
        }
        return true;
    }
}