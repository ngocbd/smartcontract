/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract BlockchainPi at 0x16fa8df7f16f9e41b7c5522cc12a22053a2a776f
*/
pragma solidity ^0.4.11;

contract BlockchainPi {

    uint total;
    uint sevencount;
    uint256 constant public MAX_UINT256 = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    
    event RollDice (address roller, uint firstdie, uint seconddie, uint newtotal);
    
    function addDiceRoll(uint _onedie, uint _twodie) public returns (bool) {
        bool oneDieFlag = checkDie(_onedie);
        bool twoDieFlag = checkDie(_twodie);
        require(oneDieFlag);
        require(twoDieFlag);
        require(total != MAX_UINT256);
        total++;
        uint addDice = _onedie + _twodie;
        if (addDice ==7) sevencount++;
        RollDice(msg.sender, _onedie, _twodie, total);
        return true;
    }
    
    function checkDie (uint _a) internal returns (bool) {
        if (_a > 0) {
            if (_a < 7) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }
    
    function getSevenCount() public returns (uint){
        return sevencount;
    }
    
    function getTotal() public returns (uint) {
       return total;
    }

}