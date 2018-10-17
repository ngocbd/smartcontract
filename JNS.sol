/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract JNS at 0x023fa9e2a97799b3d87b3fa35674b50b8b5c9f4e
*/
pragma solidity 0.4.24;

contract JNS {
    mapping (string => address) strToAddr;
    mapping (address => string) addrToStr;
    address private wallet;

    constructor (address _wallet) public {
        require(_wallet != address(0), "You must inform a valid address");
        wallet = _wallet;
    }
    
    function registerAddress (string _nickname, address _address) public payable returns (bool) {
        require (msg.value >= 1000000000000000, "Send more money");
        require (strToAddr[_nickname] == address(0), "Name already registered");
        require (keccak256(addrToStr[_address]) == keccak256(""), "Address already registered");
        
        strToAddr[_nickname] = _address;
        addrToStr[_address] = _nickname;

        wallet.transfer(msg.value);
        return true;
    }
    
    function getAddress (string _nickname) public view returns (address _address) {
        _address = strToAddr[_nickname];
    }
    
    function getNickname (address _address) public view returns (string _nickname) {
        _nickname = addrToStr[_address];
    }
}