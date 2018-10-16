/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Lime7 at 0xbc4774e29941ae1df68c21fd95325dc25f3cdf77
*/
pragma solidity ^0.4.0;

contract Lime7 {
    
    address public creatorad;

    function Lime7() {
        creatorad = msg.sender;
    }

    function feedme(uint256 amount) payable returns(bool success) {
        return true;
    }
    
    function payback(uint256 _amts) returns (string) {
        creatorad.transfer(_amts);
        return "good";
    }
    
    function get () constant returns (uint) {
        return this.balance;
    }

}