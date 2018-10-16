/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Creator at 0x02268047f5c77a6a533619773474d1a6e510443f
*/
contract Creator {
    function newContract(bytes data) public returns (address) {
        address theNewContract;
        uint s = data.length;

        assembly {
            calldatacopy(mload(0x40), 68, s)
            theNewContract := create(callvalue, mload(0x40), s)
        }

        return theNewContract;
    }
}