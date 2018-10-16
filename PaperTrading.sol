/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract PaperTrading at 0x98c12f5b4790aa3b23488e90c52058f8369b3cd8
*/
pragma solidity ^0.4.15;

contract PaperTrading {

rebalance[] public record;

struct rebalance{
        address creator;
        bytes32 shasum;
        uint256 time;
        uint256 blocknum;
        string remarks;
}

function addRecord(bytes32 shasum,string remarks) public returns (uint256 recordID) {
        recordID = record.length++;
        rebalance storage Reb = record[recordID];
        Reb.creator=msg.sender;
        Reb.shasum=shasum;
        Reb.time = block.timestamp;
        Reb.blocknum = block.number;
        Reb.remarks = remarks;
        LogRebalance(Reb.creator,Reb.shasum,Reb.remarks,Reb.time,Reb.blocknum,recordID);
}

event LogRebalance(address Creator, bytes32 sha256sum, string Remarks, uint256 time, uint256 blocknum, uint256 indexed RecordID );

}