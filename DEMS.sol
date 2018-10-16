/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract DEMS at 0xa4989f68324f3a152e05bd9b11098425b927652b
*/
pragma solidity ^0.4.19;

contract DEMS {
    event SendMessage(bytes iv, bytes epk, bytes ct, bytes mac, address sender);
    
    function sendMessage(bytes iv, bytes epk, bytes ct, bytes mac) external {
        SendMessage(iv, epk, ct, mac, msg.sender);
    }
}