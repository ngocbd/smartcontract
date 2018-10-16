/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Hellina at 0xc6145077cf7f783f4fc3ea0b89146784bca05dba
*/
pragma solidity ^0.4.21;

contract Hellina{
    address owner;
    function Hellina(){
        owner=msg.sender;
    }
    
    function Buy() payable{
        
    }
    
    function Withdraw(){
        owner.transfer(address(this).balance);
    }
}