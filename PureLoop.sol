/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract PureLoop at 0xf20d09c6368ed472123057e7c29460ef7a1ecda7
*/
pragma solidity ^0.4.19;

contract PureLoop
{
    function executePure() public pure returns (uint output) {
        uint num;
        while(true) {
            num++;
        }
        return num;
    }
    
    function executeConstant() public constant returns (uint output) {
        uint num;
        while(true) {
            num++;
        }
        return num;
    }
}