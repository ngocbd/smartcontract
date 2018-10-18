/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract ProofOfLove at 0x2492644798cb3b5162159a6e7d261fe74435eeea
*/
pragma solidity 0.4.24;

contract ProofOfLove {
    
    uint public count = 0;

    event Love(string name1, string name2);

    constructor() public { }

    function prove(string name1, string name2) external {
        count += 1;
        emit Love(name1, name2);
    }

}