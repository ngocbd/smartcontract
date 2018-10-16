/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Sylence at 0x799f987acb75a571dd95f7fd152d30f50484b837
*/
pragma solidity ^0.4.8;

contract Sylence {

  struct User {
    uint16 pubKeysCount;
    mapping(uint16 => string) pubKeys;
  }
  mapping(bytes28 => User) users;

  address owner;

  function Sylence() { owner = msg.sender; }

  function getPubKeyByHash(bytes28 phoneHash) constant returns (string pubKey) {
    User u = users[phoneHash];
    pubKey = u.pubKeys[u.pubKeysCount];
  }

  function registerNewPubKeyForHash(bytes28 phoneHash, string pubKey) {
    if(msg.sender != owner) { throw; }
    User u = users[phoneHash];
    u.pubKeys[u.pubKeysCount++] = pubKey;
  }

}