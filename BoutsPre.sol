/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract BoutsPre at 0x68756412fd30d04c821d7bb92336adae8bf51f79
*/
pragma solidity ^ 0.4.19;
library SafeMath {
    function mul(uint256 a, uint256 b) internal constant returns(uint256) {
        uint256 c = a * b;
        assert(a == 0 || c / a == b);
        return c;
    }

    function div(uint256 a, uint256 b) internal constant returns(uint256) {
        uint256 c = a / b;
        return c;
    }

    function sub(uint256 a, uint256 b) internal constant returns(uint256) {
        assert(b <= a);
        return a - b;
    }

    function add(uint256 a, uint256 b) internal constant returns(uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}
contract BoutsPre {
    using SafeMath
    for uint256;
    mapping(address => mapping(address => uint256)) allowed;
    mapping(address => uint256) balances;
    uint256 public totalSupply;
    uint256 public decimals;
    address public owner;
    bytes32 public symbol;
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed _owner, address indexed spender, uint256 value);

    function BoutsPre() {
        totalSupply = 200000000000000000;
        symbol = 'BTSP';
        owner = 0xd72f1C434C3f351B1BcEa04120450189ca958fa1;
        balances[owner] = totalSupply;
        decimals = 8;
    }

    function balanceOf(address _owner) constant returns(uint256 balance) {
        return balances[_owner];
    }

    function allowance(address _owner, address _spender) constant returns(uint256 remaining) {
        return allowed[_owner][_spender];
    }

    function transfer(address _to, uint256 _value) returns(bool) {
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) returns(bool) {
        var _allowance = allowed[_from][msg.sender];
        balances[_to] = balances[_to].add(_value);
        balances[_from] = balances[_from].sub(_value);
        allowed[_from][msg.sender] = _allowance.sub(_value);
        Transfer(_from, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) returns(bool) {
        require((_value == 0) || (allowed[msg.sender][_spender] == 0));
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;
    }

    function() {
        revert();
    }
}