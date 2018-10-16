/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Marvin at 0x12f520c2aD3D77c06f5984a54e1A3224B811e3E8
*/
pragma solidity ^0.4.0;

contract Marvin {
    address owner;
    string flag = "9KByjrJNbaRuux4tPd8868";
    bytes32 hashedflag = 0x44ad5cdba0469b29dd12b95d69bcf3b82bb7e2519a4e24b8ce0473028273d5c6;
    
    event statusCode(int32 code);

    function Marvin() payable {
        owner = msg.sender;
    }

    function freeBeerOnMe(string sha512flag) {
        if (hashedflag == keccak256(sha512flag)){
            msg.sender.transfer(this.balance);
            statusCode(42);
        }
        else{
            statusCode(-1);
        }
    }

}