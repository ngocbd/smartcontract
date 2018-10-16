/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract SimpleStorage at 0x488690160a80702e6b8e47c7d62ec2779eb5f240
*/
contract SimpleStorage {
    uint storedData;
    address storedAddress;
    
    event flag(uint val, address addr);

    function set(uint x, address y) {
        storedData = x;
        storedAddress = y;
    }

    function get() constant returns (uint retVal, address retAddr) {
        return (storedData, storedAddress);
        flag(storedData, storedAddress);

    }
}