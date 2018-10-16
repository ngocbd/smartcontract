/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract ShowFundOwner at 0x278e456912af8dde1d91c2ebcd933805a2469b4d
*/
pragma solidity ^0.4.15;


contract owned {
    address public owner;

    function owned() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        if (msg.sender != owner) revert();
        _;
    }

    function transferOwnership(address newOwner) onlyOwner {
        owner = newOwner;
    }
}


contract Fund is owned {

	/*
     * External contracts
     */
    address public tokenFund;

	/*
     * Storage
     */
    address public ethAddress;
    address public multisig;
    address public supportAddress;
    uint public tokenPrice = 1 finney; // 0.001 ETH
}


contract ShowFundOwner {
    function fund_owner() public constant returns (address)  {
        Fund fund = Fund(0xAeb5bC3786A12147C6e3b094116B6563e30E12f2);
        return fund.owner();
    }   
}