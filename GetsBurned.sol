/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract GetsBurned at 0x07d6c9b63dc0af6bdb32e924fc4e1a689391d230
*/
pragma solidity ^0.4.17;

contract GetsBurned {

    function () payable {
    }

    function BurnMe () {
        // Selfdestruct and send eth to self, 
        selfdestruct(address(this));
    }
}