/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract TokenEventLib at 0x7CF51743Ed1BCE645e1bB4A3619B73CC782C8de6
*/
pragma solidity ^0.4.0;
library TokenEventLib {
    event Transfer(address indexed _from,
                   address indexed _to,
                   bytes32 indexed _tokenID);
    event Approval(address indexed _owner,
                   address indexed _spender,
                   bytes32 indexed _tokenID);
    function _Transfer(address _from, address _to, bytes32 _tokenID) public {
        Transfer(_from, _to, _tokenID);
    }
    function _Approval(address _owner, address _spender, bytes32 _tokenID) public {
        Approval(_owner, _spender, _tokenID);
    }
}