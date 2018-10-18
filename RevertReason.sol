/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract RevertReason at 0x376c128eb3d734912de09f6ad9a8609e3f87e13f
*/
pragma solidity 0.4.25;

contract RevertReason {
    function shouldRevert(bool yes) public {
        require(!yes, "Shit it reverted!");
    }
    
    function shouldRevertWithReturn(bool yes) public returns (uint256) {
        require(!yes, "Shit it reverted!");
        return 42;
    }
    
    function shouldRevertPure(bool yes) public pure returns (uint256) {
        require(!yes, "Shit it reverted!");
        return 42;
    }
}