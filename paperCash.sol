/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract paperCash at 0x5a16f165d139796732e2d9bba86bd20c8349d12e
*/
pragma solidity ^0.4.11;


//import "../zeppelin-solidity/contracts/ownership/Ownable.sol";

contract paperCash {
	mapping (bytes32 => uint) grants;
	mapping (bytes32 => bool) claimed;

	function createGrant(bytes32 _hashedKey)
		payable
	{
		require(grants[_hashedKey] == 0);
		require(claimed[_hashedKey] == false);

		require(msg.value > 0);
		grants[_hashedKey] = msg.value;

		LogGrantCreated(_hashedKey, msg.value);
	}

	function claimGrant(bytes32 _key) 
	{
		bytes32 hashedKey = sha3(_key);

		require(!claimed[hashedKey]);
		claimed[hashedKey] = true;

		uint amount = grants[hashedKey];
		require(amount > 0);

		require(msg.sender.send(amount));

		LogGrantClaimed(hashedKey, amount);
	}

	event LogGrantCreated(bytes32 hashedKey, uint amount);
	event LogGrantClaimed(bytes32 hashedKey, uint amount);
}