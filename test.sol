/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract test at 0xd0b4e64c323186340ed2d8168ddae8f18677560e
*/
pragma solidity ^0.4.24;

contract test {
    
    function sub1(uint256 _a, uint256 _b) public pure returns (uint256 result) {
        require(_a >= _b);
        return _a - _b;
    }
    
    function sub2(uint256 _a, uint256 _b) public pure returns (uint256 result) {
        require(_a >= _b, "_a cannot be less than _b");
        return _a - _b;
    }
    
}