/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract WhiteListUser at 0x1536f307ff0a68e1356507ddccdfa2922a7ff48d
*/
pragma solidity ^0.4.11;

contract I_WhiteList {
    function contains(address) public returns(bool);
}

contract WhiteListUser {

    function assert(I_WhiteList whiteList, address addr) external {
      assert (whiteList.contains(addr));
    }

}