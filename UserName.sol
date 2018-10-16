/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract UserName at 0xD60A19876528d19487bfE17dE04c32Bf001d6643
*/
pragma solidity ^0.4.18;

contract UserName {

  mapping (address => mapping (uint => string)) public userDict;

  event OnNameChanged(uint indexed _guid, address indexed _who, string _newName);

  function changeName(uint _guid, string _newName) public {
    userDict[msg.sender][_guid] = _newName;
    OnNameChanged(_guid, msg.sender, _newName);
  }

  function nameOf(uint _guid, address _who) view public returns (string) {
    return userDict[_who][_guid];
  }
}