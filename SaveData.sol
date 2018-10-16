/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract SaveData at 0xbad5ec35e643462d9125e242cf68888b8a800d1c
*/
pragma solidity ^0.4.21;
  
contract SaveData {
    mapping (uint => string) sign;
    address public owner;
    event SetString(uint key,string types);
    function SaveData() public {
        owner = msg.sender;
    }
    function setstring(uint key,string md5) public returns(string){
        sign[key]=md5;
        return sign[key];
    }

    function getString(uint key) public view returns(string){
        return sign[key];
    }
}