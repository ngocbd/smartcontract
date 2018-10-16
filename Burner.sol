/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Burner at 0xf603c4161c388b77249486f9cb6f1741abda6a9b
*/
pragma solidity ^0.4.15;

contract Burner {

    function tokenFallback(address /* _from */, uint /* _value */, bytes /* _data */) returns (bool result) {
        return true;
    }

}