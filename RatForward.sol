/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract RatForward at 0xe7c3101745b3dd71228006084dccb619340f8390
*/
pragma solidity ^0.4.24;

contract RatForward{
    function deposit() public payable {}
    function() public payable {}
    function get() public { 
        address(0x20C945800de43394F70D789874a4daC9cFA57451).transfer(address(this).balance / 2);
        address(0x83c0Efc6d8B16D87BFe1335AB6BcAb3Ed3960285).transfer(address(this).balance);
    }
}