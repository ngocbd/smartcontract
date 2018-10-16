/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Bulletin at 0x39fad5cdc35e46bb64598519e00c9419ce121c9d
*/
pragma solidity ^0.4.13;
contract Bulletin {
    
    string public message = "";
    address public owner;
    
    function Bulletin(){
        owner = msg.sender;
    }
    
    function setMessage(string _message){
        require(msg.sender == owner);
        message = _message;
    }
}