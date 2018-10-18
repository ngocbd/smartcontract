/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract ErrorReporter at 0xe057db726b794688b1b976ccf98b970bdbeabc8a
*/
pragma solidity 0.4.25;

contract RevertReason {
    
    ErrorReporter error;
    
    constructor(address _error) public {
        error = ErrorReporter(_error);
    }
    
    function shouldRevert(bool yes) public {
        if (yes) {
            error.report("Shit it reverted!");
        }
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


contract ErrorReporter {
    function report(string reason) public pure {
        revert(reason);
    }
}