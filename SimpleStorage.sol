/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract SimpleStorage at 0x9e5be319ffabb99cdf1db65e14846ae34d249043
*/
pragma solidity ^0.4.23;

contract SimpleStorage {
    string public welcomeMsg = "Hello block chain from InfPro IT Solutions!";
    string[] public myStorage;
    
    function add(string _store) public {
        myStorage.push(_store);
    }
}