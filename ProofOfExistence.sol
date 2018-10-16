/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract ProofOfExistence at 0x1c9207daaa1da36ba34b7e1bc83810dd7390d7c9
*/
contract ProofOfExistence {
  mapping (string => uint) private proofs;

  function storeProof(string sha256) {
    proofs[sha256] = block.timestamp;
  }

  function notarize(string sha256) {
    storeProof(sha256);
  }
  

  function checkDocument(string sha256) constant returns (uint) {
    return proofs[sha256];
  }
  
}