/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract AddressNames at 0x3d42f7eb6b97ab66d8d44c725651befe02a70e5e
*/
pragma solidity 0.4.4;

contract AddressNames{

	mapping(address => string) addressNames;

	function setName(string name){
		if(bytes(name).length >= 3){
			addressNames[msg.sender] = name;
		}
	}

	function hasName(address who) constant returns (bool hasAName){
		hasAName = bytes(addressNames[who]).length != 0;
	}

	function getName(address who) constant returns (string name){
		name = addressNames[who];
	}
}