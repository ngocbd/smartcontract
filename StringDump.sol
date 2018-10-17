/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract StringDump at 0x6d105976d1a93e1ce23b825b562519144a56d7a4
*/
pragma solidity ^0.4.11;

contract StringDump {
    event Event(string value);

    function emitEvent(string value) public {

        Event(value);
    }
}