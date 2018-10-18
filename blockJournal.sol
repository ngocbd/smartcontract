/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract blockJournal at 0x5f3b2a98a2eb989d9b9dcf5869b278c09048a76c
*/
pragma solidity ^0.4.21;

contract blockJournal {
    address public creator;
    
    constructor() public {
        creator = msg.sender;
    }
    
    struct entry {
        uint time;
        uint block;
        bytes sig;
    }
    
    mapping (address=>mapping(bytes=>entry)) addressBytesEntryMap;
    
    function addEntry (bytes _sig) public {
        entry memory newEntry = entry({
           time: now,
           block: block.number,
           sig: _sig
        });
        if(addressBytesEntryMap[msg.sender][_sig].time>0) revert();
        addressBytesEntryMap[msg.sender][_sig] = newEntry;
    }
    function getEntry (address _creator, bytes _sig) public view returns (bytes sig, uint _block, uint time) {
        entry memory _entry = addressBytesEntryMap[_creator][_sig];
        return (_entry.sig, _entry.block, _entry.time);
    }
}