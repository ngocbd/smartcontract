/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Helloworld at 0x9b0239ece8deb64c5ca24e6159229b1a7b2bfd5c
*/
pragma solidity ^0.4.24;

contract Helloworld {
    string content;
    
    constructor()
    public
    {
        content = 'aaa';
    }
    
    function getContent() constant public returns (string){
        return content;
    }
}