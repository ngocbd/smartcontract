/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract C at 0x6df5df1583fa3f31d7599503d56b4fe6925e0cb9
*/
pragma solidity ^0.4.4;

contract C
{
    mapping (bytes2 => string) languageCodeToComment;
    function C() public
    {
        languageCodeToComment["ZH"] = "??";
    }
    function m() public view returns (string)
    {
        return languageCodeToComment["ZH"];
    }
}