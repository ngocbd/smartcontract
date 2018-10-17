/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract RecoverEosKey at 0x71f2ea939984349838578fbd20fd25e649c1d6a3
*/
pragma solidity ^0.4.24;

contract RecoverEosKey {
    
    mapping (address => string) public keys;
    
    event LogRegister (address user, string key);
    
    function register(string key) public {
        assert(bytes(key).length <= 64);
        keys[msg.sender] = key;
        emit LogRegister(msg.sender, key);
    }
}