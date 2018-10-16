/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Weihnachtsgeschenk at 0x16d635651d502dC59148d8E920eD793454E6bB46
*/
pragma solidity ^0.4.14;

contract Weihnachtsgeschenk {
	address public admin;
	string public from;
	string public to;
	string public message;
	string public gift;

	function Weihnachtsgeschenk(address admin_, string from_, string to_, string message_, string gift_) {
		admin = admin_;
		from = from_;
		to = to_;
		message = message_;
		gift = gift_;
	}

	function giftIsFrom() constant returns(string) {
		return from;
	}

	function giftIsTo() constant returns(string) {
		return to;
	}

	function giftMessage() constant returns(string) {
		return message;
	}

	function gift() constant returns(string) {
		return gift;
	}
}