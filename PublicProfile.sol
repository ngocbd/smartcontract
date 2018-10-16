/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract PublicProfile at 0x9ecbe3b9d68c51e81d7b6f446e7004273b944595
*/
pragma solidity ^0.4.0;

contract PublicProfile {
    mapping (address => string) nicknames;
    mapping (address => string) pictures;
    
    function setNickname (string _nickname) public {
        nicknames[msg.sender] = _nickname;
    }
    
    function setPicture (string _url) public {
        pictures[msg.sender] = _url;
    }
    
    function setInfo (string _nickname, string _url) public {
        setNickname(_nickname);
        setPicture(_url);
    }
    
    function getInfo (address _addr) public view returns (string, string) {
        return (nicknames[_addr], pictures[_addr]);
    }
}