/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Guestbook at 0x20C3e6A68A5c7d6858142624ab4E993be8d288FE
*/
pragma solidity ^0.4.10;

// A simple decentralized guestbook.
contract Guestbook {
  address creator;

  event Post(address indexed _from, string _name, string _body);

  function Guestbook() {
    creator = msg.sender;
  }

  function post(string _name, string _body) {
    require(bytes(_name).length > 0);
    require(bytes(_body).length > 0);

    Post(msg.sender, _name, _body);
  }

  function destroy() {
    require(msg.sender == creator);

    selfdestruct(creator);
  }
}