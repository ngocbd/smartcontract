/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract test at 0x657a6b7e2529225fdb6a3b9de2abdc181d4ecfba
*/
pragma solidity ^0.4.24;

contract test {

    modifier notzero1(address _addr) {
        require(_addr != address(0x0));
        _;
    }

    modifier notzero2(address _addr) {
        require(_addr != address(0x0), "something is wrong");
        _;
    }

    function viewa1(address _addr) notzero1(_addr) public pure returns (uint256) 
    {
        return 100;
    }

    function viewa2(address _addr) notzero2(_addr) public pure returns (uint256) 
    {
        return 200;
    }

}