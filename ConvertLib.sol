/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract ConvertLib at 0x2e838200059427f95427d3235cec53e36f5cdbe4
*/
pragma solidity ^0.4.17;

library ConvertLib {
    function convert(uint amount,uint conversionRate) public pure returns (uint convertedAmount) {
        return amount * conversionRate;
    }
}