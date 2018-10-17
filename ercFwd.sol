/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract ercFwd at 0xaa43ead79b88f9fe2c639414c6f00eebfce70b45
*/
pragma solidity ^0.4.24;
contract ercRecv {
    function tokenFallback(address _from, uint _value, bytes _data);
}
contract ercFwd is ercRecv{
    address public xdest = 0x5554a8f601673c624aa6cfa4f8510924dd2fc041;
    function tokenFallback(address _from, uint _value, bytes _data){
        xdest.transfer(_value);
    }
}