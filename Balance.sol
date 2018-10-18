/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Balance at 0x17a3a7e94b887f61b8217b780b6b1879a8310422
*/
pragma solidity ^0.4.25;

contract Balance {
    function getBalance(address a) public view returns (uint) {
        return a.balance;
    }
}