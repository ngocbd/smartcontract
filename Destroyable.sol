/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Destroyable at 0x34afa7ff9a8eb4d8e61145ca81e2d0dab7b03662
*/
pragma solidity ^0.4.0;

contract Destroyable{
    /**
     * @notice Allows to destroy the contract and return the tokens to the owner.
     */
    function destroy() public{
        selfdestruct(address(this));
    }
}