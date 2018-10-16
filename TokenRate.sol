/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract TokenRate at 0x7326cDc1308541a97A18D6c98DF142b98AdC26f3
*/
pragma solidity ^0.4.18;

contract TokenRate {
    uint public USDValue;
    uint public EURValue;
    uint public GBPValue;
    uint public BTCValue;
    address public owner = msg.sender;

    modifier ownerOnly() {
        require(msg.sender == owner);
        _;
    }

    function setValues(uint USD, uint EUR, uint GBP, uint BTC) ownerOnly public {
        USDValue = USD;
        EURValue = EUR;
        GBPValue = GBP;
        BTCValue = BTC;
    }
}