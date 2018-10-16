/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract SingleMessage at 0x15d3122103c5c17ed791fd5a3dba847ecfd6037e
*/
pragma solidity ^0.4.18;

// File: contracts/Ownable.sol

contract Ownable {
  address public owner;

  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

  function Ownable() public {
    owner = msg.sender;
  }

  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  function transferOwnership(address newOwner) public onlyOwner {
    require(newOwner != address(0));
    OwnershipTransferred(owner, newOwner);
    owner = newOwner;
  }

}

// File: contracts/SingleMessage.sol

contract SingleMessage is Ownable {
  string public message;
  uint256 public priceInWei;
  uint256 public maxLength;

  event MessageSet(string message, uint256 priceInWei, uint256 newPriceInWei, address payer);

  function SingleMessage(string initialMessage, uint256 initialPriceInWei, uint256 maxLengthArg) public {
    message = initialMessage;
    priceInWei = initialPriceInWei;
    maxLength = maxLengthArg;
  }

  function set(string newMessage) external payable {
    require(msg.value >= priceInWei);
    require(bytes(newMessage).length <= maxLength);

    uint256 newPrice = priceInWei * 2;
    MessageSet(newMessage, priceInWei, newPrice, msg.sender);
    priceInWei = newPrice;
    message = newMessage;
  }

  function withdraw(address destination, uint256 amountInWei) external onlyOwner {
    require(this.balance >= amountInWei);
    require(destination != address(0));
    destination.transfer(amountInWei);
  }
}