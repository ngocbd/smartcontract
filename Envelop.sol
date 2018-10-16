/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Envelop at 0x55e8288dc4f8725e548da95fb154badb53c787ca
*/
pragma solidity ^0.4.20;

contract Envelop {
    /// @dev `owner` is the only address that can call a function with this
    /// modifier
    modifier onlyOwner() {
        require(msg.sender == owner) ;
        _;
    }
    
    address public owner;

    /// @notice The Constructor assigns the message sender to be `owner`
    function Envelop() public {
        owner = msg.sender;
    }
    
    mapping(address => uint) public accounts;
    bytes32 public hashKey;
     
    function start(string _key) public onlyOwner{
        hashKey = sha3(_key);
    }
    
    function bid(string _key) public {
        if (sha3(_key) == hashKey && accounts[msg.sender] != 1) {
            accounts[msg.sender] = 1;
            msg.sender.transfer(1e16);
        }
    }
    
    function () payable {
    }
}