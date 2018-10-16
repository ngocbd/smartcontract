/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Looper at 0xd8f1da4a236c4d6f310c02dedc049b69277b7c80
*/
contract Looper {

function canDoLoop(uint _costSansLoops, uint _loopCost, uint _numberOfLoops) public constant returns (bool) {
    uint gasLimit = getGasLimit();
    uint gasForLoops = gasLimit - _costSansLoops;
    uint loopLimit = getLoopLimit(gasForLoops, _loopCost);
    if(_numberOfLoops < loopLimit) return true;
    return false;
}

function getGasLimit() internal constant returns (uint) {
    uint gasLimit;

    assembly {
        gasLimit := gaslimit
    }
    return gasLimit;
}

function getLoopLimit(uint _gasForLoops, uint _loopCost) internal constant returns (uint) {
    uint loopLimit = _gasForLoops / _loopCost;
    return loopLimit;
}

}