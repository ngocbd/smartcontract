/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract StampdPostHash at 0xa78541bC3DAd775dFC6b938a376dBCb0081CAbcB
*/
pragma solidity ^0.4.2;
// Stampd.io Contract v1.00
contract StampdPostHash {
  mapping (string => bool) private stampdLedger;
  function _storeProof(string hashResult) {
    stampdLedger[hashResult] = true;
  }
  function _checkLedger(string hashResult) constant returns (bool) {
    return stampdLedger[hashResult];
  }
  function postProof(string hashResult) {
    _storeProof(hashResult);
  }
  function proofExists(string hashResult) constant returns(bool) {
    return _checkLedger(hashResult);
  }
}