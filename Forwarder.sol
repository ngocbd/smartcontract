/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Forwarder at 0xbd6840005d25b208650414053244064f2d280c01
*/
pragma solidity ^0.4.18;

/**
 * Contract that will forward any incoming Ether to its creator
 */
contract Forwarder {
  // Address to which any funds sent to this contract will be forwarded
  address public destinationAddress;

  /**
   * Create the contract, and set the destination address to that of the creator
   */
  function Forwarder() public {
    destinationAddress = msg.sender;
  }

  /**
   * Default function; Gets called when Ether is deposited, and forwards it to the destination address
   */
  function() payable public {
        destinationAddress.transfer(msg.value);
  }

  /**
   * It is possible that funds were sent to this address before the contract was deployed.
   * We can flush those funds to the destination address.
   */
  function flush() public {
    destinationAddress.transfer(this.balance);
  }

}