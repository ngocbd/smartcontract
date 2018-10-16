/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract PureLoop at 0xb6346ce38af410a9dae2e827ba21c413aee36658
*/
pragma solidity ^0.4.19;

contract PureLoop
{
    function execute() public pure returns (uint output) {
        uint num;
        num +=execute();
        return num++;
    }
}