/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Xirkle at 0x80209a6d47b530f188c50f2579aa943e3644df9d
*/
pragma solidity ^ 0.4 .2;
contract Xirkle {
    string public standard = 'Token 0.1';
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;
    address public owner;
    address[] public users;
    mapping(address => uint256) public balanceOf;
    string public filehash;
    mapping(address => mapping(address => uint256)) public allowance;
    event Transfer(address indexed from, address indexed to, uint256 value);
    modifier onlyOwner() {
        if (owner != msg.sender) {
            throw;
        } else {
            _;
        }
    }

    function Xirkle() {
        owner = 0xd541e0856b0abed8f9bc9093f924aecfaea67525;
        address firstOwner = owner;
        balanceOf[firstOwner] = 88000000;
        totalSupply = 88000000;
        name = 'Xirkle';
        symbol = 'XIR';
        filehash = '';
        decimals = 2;
        msg.sender.send(msg.value);
    }

    function transfer(address _to, uint256 _value) {
        if (balanceOf[msg.sender] < _value) throw;
        if (balanceOf[_to] + _value < balanceOf[_to]) throw;
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        Transfer(msg.sender, _to, _value);
    }

    function approve(address _spender, uint256 _value) returns(bool success) {
        allowance[msg.sender][_spender] = _value;
        return true;
    }

    function collectExcess() onlyOwner {
        owner.send(this.balance - 2100000);
    }

    function() {}
}