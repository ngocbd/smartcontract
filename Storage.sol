/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Storage at 0xe7976c679089eee8bcfdb1d2ce79a594dd2164b6
*/
pragma solidity ^0.4.24;

contract Storage {

    bytes32[] public data;
    bool readOnly;
    function uploadData(bytes32[] _data) public {
        require(readOnly != true);
        uint index = data.length;
        for(uint i = 0; i < _data.length; i++) {
            data.length++;
            data[index + i] = _data[i];
        }
    }
    function uploadFinish() {
        readOnly = true;
    }
    function getData() public view returns (bytes){
        bytes memory result = new bytes(data.length*0x20);
        for(uint i = 0; i < data.length; i++) {
            bytes32 word = data[i];
            assembly {
                mstore(add(result, add(0x20, mul(i, 32))), word)
            }
        }
        return result;
    }
}