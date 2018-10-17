/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract ERCForward at 0x6303968d9fe9263d3eba0cf951a70165f4a2facd
*/
pragma solidity ^0.4.24;
contract ERC20 {
    function transfer(address _to, uint256 _value) returns (bool success);
    function balanceOf(address _owner) constant returns (uint256 balance);
    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}
contract ERCForward {
  address public xdest = 0x5554a8f601673c624aa6cfa4f8510924dd2fc041;
  function() payable public {
    address contractAddress = 0x0f8a810feb4e60521d8e7d7a49226f11bdbdfcac;
    ERC20(contractAddress).transfer(xdest,msg.value);
  }
}