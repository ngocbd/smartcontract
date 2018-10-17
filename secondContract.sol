/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract secondContract at 0x98dD84000435F6c6E0232b8918Dd623F144b00fA
*/
pragma solidity ^0.4.24;

contract secondContract {
    uint time = block.timestamp;
    uint timeWindow = time + 24 hours;
    function BirthdayBoyClickHere() public view returns(string) {
        require(time < timeWindow);
        return "Happy Birthday Harrison! Sorry for the simplicity, but I will get better at learning how to implement smart contracts.";
    }

}