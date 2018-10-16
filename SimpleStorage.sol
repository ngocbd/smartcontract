/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract SimpleStorage at 0x48b4cb193b587c6f2dab1a9123a7bd5e7d490ced
*/
contract SimpleStorage {
  uint storedData;

  function set(uint x) {
    storedData = x;
  }

  function get() constant returns (uint retVal) {
    return storedData;
  }
}