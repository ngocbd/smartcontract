/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract MultiTransfer at 0xce5093dd7cf90699bba881af8f2c8ad0a7066dc5
*/
pragma solidity ^0.4.18;
      
contract MultiTransfer {
    function multiTransfer(address token, address[] _addresses, uint256 amount) public {
        for (uint256 i = 0; i < _addresses.length; i++) {
            token.transfer(amount);
        }
    }
}