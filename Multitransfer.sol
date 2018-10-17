/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract MultiTransfer at 0xd326236ad1f69c0d0b961cc6083e20b1c1ce3003
*/
pragma solidity ^0.4.24;

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