/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract ProofOfExistence at 0x1d6671bad68e2ac15f72502f8a6c3bab42ccafd6
*/
contract ProofOfExistence {

  mapping (string => uint) private proofs;

  function notarize(string sha256) {

    bytes memory b_hash = bytes(sha256);
    
    if ( b_hash.length == 64 ){
      if ( proofs[sha256] != 0 ){
        proofs[sha256] = block.timestamp;
      }
    }
  }
  
  function verify(string sha256) constant returns (uint) {
    return proofs[sha256];
  }
  
}