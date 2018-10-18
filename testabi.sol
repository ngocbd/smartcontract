/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract testabi at 0xf69a313143308cb674afe2c073b53b15853633c9
*/
pragma solidity 0.4.25;
contract testabi {
    uint c;
    function tinhtong(uint a, uint b) public {
        c = a+b;
    } 
    function ketqua() public view returns (uint) {
        return c;
    }
}