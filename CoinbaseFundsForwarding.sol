/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract CoinbaseFundsForwarding at 0xbf614eaf32e40581455242579b8e20d03551212f
*/
pragma solidity ^0.4.11;

contract CoinbaseFundsForwarding
{
	address public coinbaseWallet = 0x919C812f1a0f2eA5a2c8724C910eC0B61F020Ff0;

	function () payable {
		coinbaseWallet.transfer(msg.value);
	}
}