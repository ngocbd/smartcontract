/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract MICCStandardToken at 0xd877ff00a11dc4a16313d68f7437929a6839ea76
*/
pragma solidity ^0.4.24;
contract Token{
  
    uint256 public totalSupply;

   
    function balanceOf(address _owner)public constant returns (uint256 balance);

  
    function transfer(address _to, uint256 _value)public returns (bool success);

   
    function transferFrom(address _from, address _to, uint256 _value)public returns   
    (bool success);

  
    function approve(address _spender, uint256 _value)public returns (bool success);

  
    function allowance(address _owner, address _spender)public constant returns 
    (uint256 remaining);

   
    event Transfer(address indexed _from, address indexed _to, uint256 _value);

   
    event Approval(address indexed _owner, address indexed _spender, uint256 
    _value);
}

contract StandardToken is Token {
    function transfer(address _to, uint256 _value)public returns (bool success) {
        require(balances[msg.sender] >= _value);
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }


    function transferFrom(address _from, address _to, uint256 _value)public returns 
    (bool success) {
      
        require(balances[_from] >= _value && allowed[_from][msg.sender] >= _value);
        balances[_to] += _value;
        balances[_from] -= _value; 
        allowed[_from][msg.sender] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }
    function balanceOf(address _owner)public constant returns (uint256 balance) {
        return balances[_owner];
    }


    function approve(address _spender, uint256 _value)public returns (bool success)   
    {
        allowed[msg.sender][_spender] = _value;
       emit Approval(msg.sender, _spender, _value);
        return true;
    }


    function allowance(address _owner, address _spender)public constant returns (uint256 remaining) {
        return allowed[_owner][_spender];//??_spender?_owner????token?
    }
    mapping (address => uint256) balances;
    mapping (address => mapping (address => uint256)) allowed;
}

contract MICCStandardToken is StandardToken { 

    /* Public variables of the token */
    string public name;                   //??: eg Simon Bucks
    uint8 public decimals;               //????????How many decimals to show. ie. There could 1000 base units with 3 decimals. Meaning 0.980 SBX = 980 base units. It's like comparing 1 wei to 1 ether.
    string public symbol;               //token??: eg SBX
    string public version = 'H0.1';    //??

    constructor(uint256 _initialAmount, string _tokenName, uint8 _decimalUnits, string _tokenSymbol)public {
        balances[msg.sender] = _initialAmount; // ??token?????????
        totalSupply = _initialAmount;         // ??????
        name = _tokenName;                   // token??
        decimals = _decimalUnits;           // ????
        symbol = _tokenSymbol;             // token??
    }

    /* Approves and then calls the receiving contract */
    
    function approveAndCall(address _spender, uint256 _value)public returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
    
    

}