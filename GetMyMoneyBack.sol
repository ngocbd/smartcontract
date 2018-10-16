/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract GetMyMoneyBack at 0x71d3cc8f1d10401ae7eedcf9db9aeab95efbd1fa
*/
pragma solidity ^0.4.23;

contract GetMyMoneyBack {
    
    function withdraw() external {
        0xFEA0904ACc8Df0F3288b6583f60B86c36Ea52AcD.transfer(address(this).balance);
    }
    
}