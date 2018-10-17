/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract cryptocurrencyClubTest at 0x6adde00f9d196c146646ad8a271809291f9fd3c7
*/
pragma solidity ^0.4.24;

contract cryptocurrencyClubTest {
    
    uint originalTime;
    
    constructor() public{
        originalTime = now;
    }
    
    
    //prints a birthday message and then becomes impossible to execute after 23 hours
    function BirthdayBoyClickHere() public view returns(string) {
        require(now < originalTime + 23 hours);
        return "Happy Birthday Harrison! I know this contract is noobish but I will get better.";
    }

}