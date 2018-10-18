/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract ERC20AllOne at 0x61dd63c8eb3344903461b8ee35bf8ad5b8f507a3
*/
pragma solidity ^0.4.24;

contract ERC20AllOne {

    string public constant name = "AllAddressesHave1Balance";
    string public constant symbol = "VOTERS";
    uint8 public constant decimals = 18;  // 18 is the most common number of decimal places
    
    function balanceOf(address) external pure returns (uint) {
        return 1 * 10 ** uint(decimals);
    }

}