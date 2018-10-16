/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract ProofOfExistence at 0x4e7c5ae901c0d34a45ba83ba2ba2c2b9e5247625
*/
contract ProofOfExistence {

  mapping (string => uint) private proofs;

  function notarize(string sha256) {

    bytes memory b_hash = bytes(sha256);
    
    if ( b_hash.length == 64 ){
      if ( proofs[sha256] == 0 ){
        proofs[sha256] = block.timestamp;
      }
    }
  }
  
  function verify(string sha256) constant returns (uint) {
    return proofs[sha256];
  }
  
}