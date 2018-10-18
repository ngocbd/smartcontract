/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract NiMingToken at 0x73908ffd424d36ac25190d71e82a048fe49eb7e3
*/
pragma solidity ^0.4.23;
contract Token{
    // token???????public??????getter????????totalSupply().
    uint256 public totalSupply;

    /// ????_owner??token??? 
    function balanceOf(address _owner) constant returns (uint256 balance);

    //??????????_to??????_value?token
    function transfer(address _to, uint256 _value) returns (bool success);

    //???_from????_to????_value?token??approve??????
    function transferFrom(address _from, address _to, uint256 _value) returns   
    (bool success);

    //??????????_spender????????????_value?token
    function approve(address _spender, uint256 _value) returns (bool success);

    //????_spender?????_owner???token??? 
    function allowance(address _owner, address _spender) constant returns 
    (uint256 remaining);

    //????????????? 
    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    //???approve(address _spender, uint256 _value)????????????
    event Approval(address indexed _owner, address indexed _spender, uint256 
    _value);
}

library SafeMath {
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract StandardToken is Token {
    using SafeMath for uint256;
    function transfer(address _to, uint256 _value) returns (bool success) {
        require(_to != address(0));
        require(balances[msg.sender] >= _value);
        balances[msg.sender] = balances[msg.sender].sub(_value);//???????????token??_value
        balances[_to] = balances[_to].add(_value);//???????token??_value
        Transfer(msg.sender, _to, _value);//????????
        return true;
    }


    function transferFrom(address _from, address _to, uint256 _value) returns 
    (bool success) {
        require(_to != address(0));
        require(balances[_from] >= _value && allowed[_from][msg.sender] >= _value);
        balances[_to] = balances[_to].add(_value);//??????token??_value
        balances[_from] = balances[_from].sub(_value); //????_from??token??_value
        allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);//??????????_from????????_value
        Transfer(_from, _to, _value);//????????
        return true;
    }
    function balanceOf(address _owner) constant returns (uint256 balance) {
        return balances[_owner];
    }


    function approve(address _spender, uint256 _value) returns (bool success)   
    {
        require((_value == 0) || (allowed[msg.sender][_spender] == 0));
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;
    }


    function allowance(address _owner, address _spender) constant returns (uint256 remaining) {
        return allowed[_owner][_spender];//??_spender?_owner????token?
    }
    mapping (address => uint256) balances;
    mapping (address => mapping (address => uint256)) allowed;
}

contract NiMingToken is StandardToken { 

    /* Public variables of the token */
    string public name;                   //??: eg Simon Bucks
    uint8 public decimals;               //????????How many decimals to show. ie. There could 1000 base units with 3 decimals. Meaning 0.980 SBX = 980 base units. It's like comparing 1 wei to 1 ether.
    string public symbol;               //token??: eg SBX
    string public version = 'H0.1';    //??

    function NiMingToken(uint256 _initialAmount, string _tokenName, uint8 _decimalUnits, string _tokenSymbol) {
        balances[msg.sender] = _initialAmount; // ??token?????????
        totalSupply = _initialAmount;         // ??????
        name = _tokenName;                   // token??
        decimals = _decimalUnits;           // ????
        symbol = _tokenSymbol;             // token??
    }

    /* Approves and then calls the receiving contract */
    
    function approveAndCall(address _spender, uint256 _value, bytes _extraData) returns (bool success) {
        require((_value == 0) || (allowed[msg.sender][_spender] == 0));
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        //call the receiveApproval function on the contract you want to be notified. This crafts the function signature manually so one doesn't have to include a contract in here just for this.
        //receiveApproval(address _from, uint256 _value, address _tokenContract, bytes _extraData)
        //it is assumed that when does this that the call *should* succeed, otherwise one would use vanilla approve instead.
        require(_spender.call(bytes4(bytes32(sha3("receiveApproval(address,uint256,address,bytes)"))), msg.sender, _value, this, _extraData));
        return true;
    }

}