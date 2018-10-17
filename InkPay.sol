/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract InkPay at 0xc9e1bfc91312927fb10e76d6af671ea11c828815
*/
pragma solidity ^0.4.11;

// File: ink-protocol/contracts/InkOwner.sol

interface InkOwner {
  function authorizeTransaction(uint256 _id, address _buyer) external returns (bool);
}

// File: contracts/InkPay.sol

contract InkPay is InkOwner {
  function authorizeTransaction(uint256 /* _id */, address /* _buyer */) external returns (bool) {
    return true;
  }
}