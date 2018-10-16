/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract UBCToken at 0x91654eAf7828E7e05d2847Aa27405D9925C3dc0d
*/
pragma solidity ^0.4.8;

contract ERC20Interface {    
    function totalSupply() constant returns (uint256 totalSupply);
    function balanceOf(address _owner) constant returns (uint256 balance);
    function transfer(address _to, uint256 _value) returns (bool success);
    function transferFrom(address _from, address _to, uint256 _value) returns (bool success);
    function approve(address _spender, uint256 _value) returns (bool success);
    function allowance(address _owner, address _spender) constant returns (uint256 remaining);
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}


contract UBCToken is ERC20Interface{
    /* ??????*/
    string public standard = 'Token 1.0.8';
    string public constant name="Ubiquitous Business Credit 2.0";
    string public constant symbol="UBC";
    uint8 public constant decimals=10;
    uint256 public constant _totalSupply=10000000000000000000;
    /*??????????*/
    mapping(address => mapping (address => uint256)) allowed;

    //mapping (address => uint256) public balanceOf;
    mapping(address => uint256) balances;
    //mapping (address => mapping (address => uint256)) public allowance;
    address public owner;
    /* ??*/
    function UBCToken() {
        owner = msg.sender;
        balances[owner] = _totalSupply; 
    }
    
    function totalSupply() constant returns (uint256 totalSupply) {
          totalSupply = _totalSupply;
    }
    
    /*balanceOf*/
    function balanceOf(address _owner) constant returns (uint256 balance){
        return balances[_owner]; 
    }

    /* transfer */
    function transfer(address _to, uint256 _amount) returns (bool success)  {
       if (balances[msg.sender] >= _amount 
              && _amount > 0
              && balances[_to] + _amount > balances[_to]) {
              balances[msg.sender] -= _amount;
              balances[_to] += _amount;
              Transfer(msg.sender, _to, _amount);
              return true;
          } else {
              return false;
          }
    }

    /*transferFrom*/
    function transferFrom(address _from, address _to, uint256 _amount) returns (bool success){
        if (balances[_from] >= _amount
             && _amount > 0
             && balances[_to] + _amount > balances[_to]  && _amount <= allowed[_from][msg.sender]) {
             balances[_from] -= _amount;
             balances[_to] += _amount;
             allowed[_from][msg.sender] -= _amount;
             Transfer(_from, _to, _amount);
             return true;
         } else {
             return false;
         }
    }

    /**/
    function approve(address _spender, uint256 _value) 
        returns (bool success){
         allowed[msg.sender][_spender] = _value;
         Approval(msg.sender, _spender, _value);
         return true;
    }
    /**/
    function allowance(address _owner, address _spender) constant returns (uint256 remaining)
    {
        return allowed[_owner][_spender];
    }
    
}