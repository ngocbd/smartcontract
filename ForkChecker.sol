/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract ForkChecker at 0x0b0e47119bf5495dfcd9264916a9fe3481cd24c7
*/
pragma solidity ^0.4.0;
contract ForkChecker {
  bool public isFork;
  uint256 public bnCheck;
  bytes32 public bhCheck;

  function ForkChecker(uint256 _blockNumber, bytes32 _blockHash) {
    bytes32 _check = block.blockhash(_blockNumber);
    bhCheck = _blockHash;
    bnCheck = _blockNumber;
    if (_check == _blockHash) {
      isFork = true;
    }
  }
}