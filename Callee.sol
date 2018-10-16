/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Callee at 0x2130fda6b4d6d2d549e54241ada5e2c903b0efee
*/
pragma solidity ^0.4.10;

contract Callee {
    event ReceivedCall();
    
    function () {
        ReceivedCall();
    }
}