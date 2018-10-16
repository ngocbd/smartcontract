/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract EtheremonTrade at 0x65c440683088134aef7af22f3fad6a9ee5c19fed
*/
pragma solidity ^0.4.16;

interface EtheremonTradeInterface {
    function isOnTrading(uint64 _objId) constant external returns(bool);
}

contract EtheremonTrade is EtheremonTradeInterface {
    function isOnTrading(uint64 _objId) constant external returns(bool) {
        return false;
    }
}