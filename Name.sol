/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Name at 0x75051407bb4ce22d3e6c38748237a3554e93d328
*/
pragma solidity ^0.4.12;

// Reward Channel contract

contract Name{
    address public owner = msg.sender;
    string public name;

    modifier onlyBy(address _account) { require(msg.sender == _account); _; }


    function Name(string myName) public {
      name = myName;
    }

    function() payable public {}

    function withdraw() onlyBy(owner) public {
      owner.transfer(this.balance);
    }

    function destroy() onlyBy(owner) public{
      selfdestruct(this);
    }
}