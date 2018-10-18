/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Sinocbot at 0x4577aacd7be34c395a1c3f0e4984fee231899e30
*/
pragma solidity ^0.4.25;

contract Sinocbot {

    function batchTransfer(address _tokenAddress, address[] _receivers, uint256[] _values) public {

        require(_receivers.length == _values.length && _receivers.length >= 1);
        bytes4 methodId = bytes4(keccak256("transferFrom(address,address,uint256)"));
        for(uint256 i = 0 ; i < _receivers.length; i++){
            if(!_tokenAddress.call(methodId, msg.sender, _receivers[i], _values[i])) {
                revert();
            }
        }
    }
}