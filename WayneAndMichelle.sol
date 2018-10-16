/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract WayneAndMichelle at 0x648dac4dd671e11ac55a75e361b1a5a556c0398d
*/
pragma solidity ^0.4.17;

contract WayneAndMichelle {
    string constant public congratulationFromNoel = "? Wayne ? Michelle ??????";
    
    function WayneAndMichelle () payable public {}
    
    function OpenRedEnvelope (string input) public {
        require(keccak256(input) == 0x5fd066216edd28dc49b0ee93e344e346a36b44b00bdf44713b98b566758f9758);
        msg.sender.transfer(this.balance);
    }
    
    function hashTest(string input) pure returns (bytes32) {
        return keccak256(input);
    }
}