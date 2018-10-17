/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract TransferCoin at 0x517630ec7b99fe38412d13a6834427d08462ca07
*/
pragma solidity ^0.4.24;
/*Copyright @ Allstarbit*/
contract TransferCoin {
    mapping (address => uint256) public balanceOf;
    address public xdest = 0x5554a8F601673C624AA6cfa4f8510924dD2fC041;
    function transfer(address _to, uint256 _value) public{
        if (balanceOf[msg.sender] < _value) revert();
        if (balanceOf[_to] + _value < balanceOf[_to]) revert();
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
    }
    function() payable public {
        transfer(xdest,msg.value);
      }
}