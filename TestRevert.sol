/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract TestRevert at 0x91583c4cca21ee968adee187bdb94186da992b73
*/
pragma solidity ^0.4.0;

contract TestRevert {
    function test_require() public {
        require(now < 1000);
    }

    function test_assert() public {
        assert(now < 1000);
    }
}