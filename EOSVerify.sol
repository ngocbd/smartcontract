/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract EOSVerify at 0x52cb028122a396598953bb613f56d7d249084dd5
*/
pragma solidity ^0.4.23;

/**
 * @title A contract that maintains a hashtable of EOS addresses associated with Ethereum addresses
 * @author Sagewise
 */
contract EOSVerify {
  event LogRegisterEOSAddress(address indexed _from, string _eosAddress);
  mapping(address => string) public eosAddressBook;

  /**
   * @notice Associate a string, which represents an EOS address, to the Ethereum address of the entity interacting with the contract
   * @param eosAddress A string value that represents an EOS address
   */
  function registerEOSAddress(string eosAddress) public {
    assert(bytes(eosAddress).length <= 64);

    eosAddressBook[msg.sender] = eosAddress;

    emit LogRegisterEOSAddress(msg.sender, eosAddress);
  }
}