/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract storer at 0xf5b3c6e5052f25a529751670ca9bdb8dd61c6dd2
*/
pragma solidity ^0.4.2;
contract storer {
address public owner;
string public log;
function storer() {
    owner = msg.sender ;
}
modifier onlyOwner {
        if (msg.sender != owner)
            throw;
        _;
    }
function store(string _log) onlyOwner() {
    log = _log;
}
function kill() onlyOwner() {
  selfdestruct(owner); }
}