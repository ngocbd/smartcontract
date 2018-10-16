/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract KangKangToken at 0x6029c3ab189ec60ba4815f39dcd7895d9ed277da
*/
pragma solidity ^0.4.8;
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

contract StandardToken is Token {
    function transfer(address _to, uint256 _value) returns (bool success) {
        //??totalSupply ??????? (2^256 - 1).
        //??????????????token??????????????????
        //require(balances[msg.sender] >= _value && balances[_to] + _value > balances[_to]);
        require(balances[msg.sender] >= _value);
        balances[msg.sender] -= _value;//???????????token??_value
        balances[_to] += _value;//???????token??_value
        Transfer(msg.sender, _to, _value);//????????
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) returns 
    (bool success) {
        //require(balances[_from] >= _value && allowed[_from][msg.sender] >= 
        // _value && balances[_to] + _value > balances[_to]);
        require(balances[_from] >= _value && allowed[_from][msg.sender] >= _value);
        balances[_to] += _value;//??????token??_value
        balances[_from] -= _value; //????_from??token??_value
        allowed[_from][msg.sender] -= _value;//??????????_from????????_value
        Transfer(_from, _to, _value);//????????
        return true;
    }
    
    function balanceOf(address _owner) constant returns (uint256 balance) {
        return balances[_owner];
    }

    function approve(address _spender, uint256 _value) returns (bool success)   
    {
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

contract KangKangToken is StandardToken {
    string public constant name = "Kang Kang Token";
    string public constant symbol = "KKT";
    uint8 public constant decimals = 18;

    uint256 public constant ONE_TOKENS = (10 ** uint256(decimals));
    uint256 public constant MILLION_TOKENS = (10**6) * ONE_TOKENS;
    uint256 public constant TOTAL_TOKENS = 1500 * MILLION_TOKENS;

    function KangKangToken ()    
    {
        balances[msg.sender] = TOTAL_TOKENS; // ??token?????????
        totalSupply = TOTAL_TOKENS;         // ??????
    }   
}