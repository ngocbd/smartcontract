/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract GetsBurned at 0x2f976a5382c0c6214b3d8fe6bdc5379edd35d9d4
*/
pragma solidity ^0.4.0;
contract GetsBurned {
    function () payable public {
    }

    function BurnMe() public {
        // Selfdestruct and send eth to self, 
        selfdestruct(address(this));
    }
}