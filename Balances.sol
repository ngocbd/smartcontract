/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Balances at 0x0ae823c44b3485918b359329f9f77925c1478082
*/
pragma solidity ^0.4.23;

interface Token {
    function balanceOf(address) external view returns(uint);
}

contract Balances {
    function getBalances(address[] users, Token[] tokens) external view returns(uint[]) {
        uint numUsers = users.length;
        uint numTokens = tokens.length;
        uint[] memory result = new uint[](numUsers * numTokens);
        uint resultInd = 0;
        uint userInd = 0;
        uint tokenInd = 0;
        
        for(userInd = 0 ; userInd < numUsers ; userInd++) {
            for(tokenInd = 0 ; tokenInd < numTokens ; tokenInd++) {
                result[resultInd++] = tokens[tokenInd].balanceOf(users[userInd]);
            }
        }
        
        return result;
        
    }
}