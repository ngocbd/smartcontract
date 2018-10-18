/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract BalanceReader at 0x0efd67fc9633bb9d1f4eaa14eb497b4564383d7f
*/
pragma solidity 0.4.25;

// Ethfinex 2018

contract WrapperInterface {
    function balanceOf(address who) public view returns (uint256);
    function depositLock(address who) public view returns (uint256);
}

contract BalanceReader {
    function allBalances(address[] _tokens, address _who) public view returns (uint256[] balances, uint256[] locks) {
        balances = new uint256[](_tokens.length);
        locks = new uint256[](_tokens.length);
        for (uint i = 0; i < _tokens.length; i++) {
            balances[i] = WrapperInterface(_tokens[i]).balanceOf(_who);
            locks[i] = WrapperInterface(_tokens[i]).depositLock(_who);
        }
    }
}