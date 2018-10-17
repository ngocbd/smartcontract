/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract HNContract at 0x6fe4504097bdacd36ac21180a454e0782a682e21
*/
pragma solidity ^0.4.16;
contract Token{
  uint256 public totalSupply;

  function balanceOf(address _owner) public constant returns (uint256 balance);
  function transfer(address _to, uint256 _value) public returns (bool success);
  function transferFrom(address _from, address _to, uint256 _value) public returns
  (bool success);

  function approve(address _spender, uint256 _value) public returns (bool success);

  function allowance(address _owner, address _spender) public constant returns
  (uint256 remaining);

  event Transfer(address indexed _from, address indexed _to, uint256 _value);
  event Approval(address indexed _owner, address indexed _spender, uint256
  _value);
  event Burn(address indexed from, uint256 value);
  event Inflat(address indexed from, uint256 value);

}

contract HNContract is Token {

  // string public name;                   //?????"My test token"
  // uint8 public decimals;               //??token?????????????????3?????0.001??.
  // string public symbol;               //token??,like MTT

  uint8 constant public decimals = 18;
  string constant public name = "HNContract";
  string constant public symbol = "NN";
  uint public totalSupply = 1000000000 * 10 ** uint256(decimals);
  address contract_creator;


  // function TokenDemo(uint256 _initialAmount, string _tokenName, uint8 _decimalUnits, string _tokenSymbol) public {
  function HNContract() public {

    // totalSupply = _initialAmount * 10 ** uint256(_decimalUnits);         // ??????
    balances[msg.sender] = totalSupply; // ??token??????????????????????????????
    // record contract_creator
    contract_creator=msg.sender;
    // name = _tokenName;
    // decimals = _decimalUnits;
    // symbol = _tokenSymbol;
  }
  
  function inflat(uint256 _value) public returns(bool success){
    require(msg.sender == contract_creator);
    require(_value > 0);
    totalSupply += _value;
    balances[contract_creator] +=_value;
    Inflat(contract_creator, _value);
    return true;
  }

  function transfer(address _to, uint256 _value) public returns (bool success) {
    //??totalSupply ??????? (2^256 - 1).
    //??????????????token??????????????????
    require(balances[msg.sender] >= _value && balances[_to] + _value > balances[_to]);
    require(_to != 0x0);
    balances[msg.sender] -= _value;//???????????token??_value
    balances[_to] += _value;//???????token??_value
    Transfer(msg.sender, _to, _value);//????????
    return true;
  }


  function transferFrom(address _from, address _to, uint256 _value) public returns
  (bool success) {
    require(balances[_from] >= _value && allowed[_from][msg.sender] >= _value);
    balances[_to] += _value;//??????token??_value
    balances[_from] -= _value; //????_from??token??_value
    allowed[_from][msg.sender] -= _value;//??????????_from????????_value
    Transfer(_from, _to, _value);//????????
    return true;
  }
  function balanceOf(address _owner) public constant returns (uint256 balance) {
    return balances[_owner];
  }


  function approve(address _spender, uint256 _value) public returns (bool success)
  {
    allowed[msg.sender][_spender] = _value;
    Approval(msg.sender, _spender, _value);
    return true;
  }

  function allowance(address _owner, address _spender) public constant returns (uint256 remaining) {
    return allowed[_owner][_spender];//??_spender?_owner????token?
  }
  
  function burn(uint256 _value) public {
    require(_value > 0);
    require(_value <= balances[msg.sender]);
    // no need to require value <= totalSupply, since that would imply the
    // sender's balance is greater than the totalSupply, which *should* be an assertion failure

    address burner = msg.sender;
    balances[burner] -= _value;
    totalSupply -=_value;
    Burn(burner, _value);
  }
  mapping (address => uint256) balances;
  mapping (address => mapping (address => uint256)) allowed;
}