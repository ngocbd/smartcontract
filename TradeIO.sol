/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract TradeIO at 0x5a8bf35d54bf2e55b423d4c915bbb944d3848461
*/
pragma solidity ^0.4.19;

contract TradeIO {
    address owner;
    mapping(bytes8 => string) dateToHash;
    
    modifier onlyOwner () {
        require(owner == msg.sender);
        _;
    }
    
    function TradeIO () public {
        owner = msg.sender;
    }
    
    function changeOwner(address _newOwner) public onlyOwner {
        owner = _newOwner;
    }
    
    function saveHash(bytes8 date, string hash) public onlyOwner {
        require(bytes(dateToHash[date]).length == 0);
        dateToHash[date] = hash;
    }
    
    function getHash(bytes8 date) public constant returns (string) {
        require(bytes(dateToHash[date]).length != 0);
        return dateToHash[date];
    }
}