/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract TimeBasedContract at 0xc1c826668e3661e137e17186b9c64cc408fa5cdd
*/
pragma solidity ^0.4.4;

contract TimeBasedContract
{
    function TimeBasedContract() public {
    }

    function() public payable {
        uint minutesTime = (now / 60) % 60;
        require(((minutesTime/10)*10) == minutesTime);
    }
}