/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract HelloWorldContact at 0x4d88aded2579ea30b95db8136c771c2e6286113b
*/
pragma solidity ^0.4.24;

contract HelloWorldContact {
	string word = "Hello World";
	address owner;
	
	function HelloWorldContract() {
		owner = msg.sender;
	}

	function getWord() constant returns(string) {
		return word;
	}

	function setWord(string newWord) constant returns(string) {
		if (owner !=msg.sender) {
			return 'You shall not pass';
		}
		word = newWord;
		return 'You successfully changed the variable word';
	}
}