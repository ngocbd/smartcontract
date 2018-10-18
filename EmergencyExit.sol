/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract EmergencyExit at 0x9da6b79f11010a386039a6a2d80af341900b701b
*/
pragma solidity ^0.4.25;

//This contract is for anyone that interacts with a p3d style contract that didn't publish their code on etherscan

contract contractX 
{
  function exit() public;
}

contract EmergencyExit {
  address unknownContractAddress;

  function callExitFromUnknownContract(address contractAddress) public 
  {
     contractX(contractAddress).exit();
     address(msg.sender).transfer(address(this).balance);
  }
}