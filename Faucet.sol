/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Faucet at 0x4f74e35d8710b417cc3a8b80948a85b4b49523ec
*/
pragma solidity 0.4.24;

/**
 * @title ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/20
 */
contract ERC20Old {
  function totalSupply() public view returns (uint256);
  function balanceOf(address who) public view returns (uint256);
  function transfer(address to, uint256 value) public;
  event Transfer(address indexed from, address indexed to, uint256 value);
  function allowance(address owner, address spender) public view returns (uint256);
  function transferFrom(address from, address to, uint256 value) public;
  function approve(address spender, uint256 value) public returns (bool);
  event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract Faucet {
    
    address public token;
    uint public decimals;
    uint public dripAmount;
    mapping (address => bool) public alreadyReceived;
    
    modifier newUser() {
        require(!alreadyReceived[msg.sender]);
        _;
    }
    
    
    constructor(address _token, uint _decimals, uint _dripAmount) public {
        token = _token;
        decimals = _decimals;
        dripAmount = _dripAmount;
    }
    
    function dripMe() public newUser {
        ERC20Old(token).transfer(msg.sender, dripAmount * 10 ** decimals);
        alreadyReceived[msg.sender] = true;
    }
    
}