/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract StarmidFreezeTokens at 0xe40818f637e3ee67e2bf9bbc8903b1880db24b27
*/
pragma solidity 0.4.24;


contract StarmidTransfer {
    
    function transfer(address _to, uint256 _value) public returns (bool _result) {
		_result = true;
	}
    
}

contract StarmidFreezeTokens {
	
	StarmidTransfer public StarmidFunc;
	address public owner;
	
	constructor(address _addr) {
		StarmidFunc = StarmidTransfer(_addr);
		owner = 0x378B9eea7ab9C15d9818EAdDe1156A079Cd02ba8;
	}

	function refundTokens(address _to, uint _amount) public returns(bool) {
			require(block.timestamp > 1601510400 && msg.sender == owner);//Thu, 01 Oct 2020 00:00:00 GMT
			StarmidFunc.transfer(_to,_amount);
			return true;
		}
}