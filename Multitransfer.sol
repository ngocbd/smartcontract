/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract MultiTransfer at 0x0b10372ffe11a4fe9fc8efbf460b6fa25eb224d9
*/
pragma solidity ^0.4.18;
contract ERC20 {
    function transfer(address _recipient, uint256 amount) public;
}       
contract MultiTransfer {
    function multiTransfer(ERC20 token, address[] _addresses, uint256 amount) public {
        for (uint256 i = 0; i < _addresses.length; i++) {
            token.transfer(_addresses[i], amount);
        }
    }
}