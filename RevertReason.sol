/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract RevertReason at 0x8799c361b00fee1a5e6c67877b172b9dd9292c3e
*/
pragma solidity 0.4.25;

contract RevertReason {
    
    ErrorReporter public error;
    
    constructor(address _error) public {
        require(_error != address(0x0));
        error = ErrorReporter(_error);
    }
    
    function shouldRevert(bool yes) public {
        if (yes) {
            error.report("Shit it reverted!");
        }
    }
    
    function shouldRevertWithReturn(bool yes) public returns (uint256) {
        if (yes) {
            error.report("Shit it reverted!");
        }
        return 42;
    }
    
    function shouldRevertPure(bool yes) public view returns (uint256) {
        if (yes) {
            error.report("Shit it reverted!");
        }
        return 42;
    }
}


contract ErrorReporter {
    function report(string reason) public pure {
        revert(reason);
    }
}