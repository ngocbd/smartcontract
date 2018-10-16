/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract passOnContract at 0x9edd3447ef75bf40aa9da993e4b5d0c7ae5a5a73
*/
pragma solidity ^0.4.21;

  contract MBLToken {
    function transfer(address _to, uint256 _value) public;
    function balanceOf(address _tokenOwner) external view returns (uint balance);

 }

    contract passOnContract {

    address public owner;
  	address public tokenAddress = 0x8D7dDaD45789a64c2AF9b4Ce031C774e277F1Cd4;

  	function passOnContract() public {

  		owner = msg.sender;
  	}


    function () public payable {

    	owner.transfer(msg.value);
    	MBLToken mblToken = MBLToken(tokenAddress);
    	mblToken.transfer(msg.sender, msg.value*40);

    }

}