/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract HLCToken at 0x58c69ed6cd6887c0225d1fccecc055127843c69b
*/
/**
 * ERC20 token
 *
 * https://github.com/ethereum/EIPs/issues/20
 */
contract ERC20 {
  // token??
  uint public totalSupply;
  // ????_owner??token???
  function balanceOf(address _owner) constant returns (uint);
  //????_spender?????_owner???token???
  function allowance(address _owner, address _spender) constant returns (uint);
  // ????????_to??????_value?token
  function transfer(address _to, uint _value) returns (bool ok);
  //???_from????_to????_value?token??approve??????
  function transferFrom(address _from, address _to, uint _value) returns (bool ok);
  // ??????????_spender????????????_value?token
  function approve(address _spender, uint _value) returns (bool ok);
  //?????????????, ?transfer????????????
  event Transfer(address indexed _from, address indexed _to, uint _value);
  //???approve(address spender, uint value)????????????
  event Approval(address indexed _owner, address indexed _spender, uint _value);
}



/**
 * ???????????
 */
contract SafeMath {
  function safeMul(uint a, uint b) internal returns (uint) {
    uint c = a * b;
    assert(a == 0 || c / a == b);
    return c;
  }

  function safeDiv(uint a, uint b) internal returns (uint) {
    assert(b > 0);
    uint c = a / b;
    assert(a == b * c + a % b);
    return c;
  }

  function safeSub(uint a, uint b) internal returns (uint) {
    assert(b <= a);
    return a - b;
  }

  function safeAdd(uint a, uint b) internal returns (uint) {
    uint c = a + b;
    assert(c>=a && c>=b);
    return c;
  }

  function max64(uint64 a, uint64 b) internal constant returns (uint64) {
    return a >= b ? a : b;
  }

  function min64(uint64 a, uint64 b) internal constant returns (uint64) {
    return a < b ? a : b;
  }

  function max256(uint256 a, uint256 b) internal constant returns (uint256) {
    return a >= b ? a : b;
  }

  function min256(uint256 a, uint256 b) internal constant returns (uint256) {
    return a < b ? a : b;
  }

  function assert(bool assertion) internal {
    if (!assertion) {
      throw;
    }
  }
}



/**
 * ???ERC20 short address attack?????ERC20 Token.
 *
 * Based on:
 * https://github.com/Firstbloodio/token/blob/master/smart_contract/FirstBloodToken.sol
 */
contract StandardToken is ERC20, SafeMath {

  //???????????????address????????uint256?
  mapping(address => uint) balances;
  mapping (address => mapping (address => uint)) allowed;

  /**
   *
   * ??ERC20 short address attack
   *
   * http://vessenes.com/the-erc20-short-address-attack-explained/
   */
  modifier onlyPayloadSize(uint size) {
     if(msg.data.length < size + 4) {
       throw;
     }
     _;
  }

  function transfer(address _to, uint _value) onlyPayloadSize(2 * 32) returns (bool success) {
    //???????????token??_value
    balances[msg.sender] = safeSub(balances[msg.sender], _value);
    //???????token??_value
    balances[_to] = safeAdd(balances[_to], _value);
    //????????
    Transfer(msg.sender, _to, _value);
    return true;
  }

  function transferFrom(address _from, address _to, uint _value)  returns (bool success) {
    var _allowance = allowed[_from][msg.sender];

    //??????token??_value
    balances[_to] = safeAdd(balances[_to], _value);
    //????_from??token??_value
    balances[_from] = safeSub(balances[_from], _value);
    //??????????_from????????_value
    allowed[_from][msg.sender] = safeSub(_allowance, _value);
    //????????
    Transfer(_from, _to, _value);
    return true;
  }

  function balanceOf(address _owner) constant returns (uint balance) {
    return balances[_owner];
  }

  function approve(address _spender, uint _value) returns (bool success) {
    if ((_value != 0) && (allowed[msg.sender][_spender] != 0)) throw;
    allowed[msg.sender][_spender] = _value;
    Approval(msg.sender, _spender, _value);
    return true;
  }

  function allowance(address _owner, address _spender) constant returns (uint remaining) {
    //??_spender?_owner????token?
    return allowed[_owner][_spender];
  }

}


/**
 * ??token?????token??
 * ?Burned??????????transfers
 */
contract BurnableToken is StandardToken {

  address public constant BURN_ADDRESS = 0;

  event Burned(address burner, uint burnedAmount);

  /**
   * ??Token
   *
   */
  function burn(uint burnAmount) {
    address burner = msg.sender;
    balances[burner] = safeSub(balances[burner], burnAmount);
    totalSupply = safeSub(totalSupply, burnAmount);
    Burned(burner, burnAmount);
    Transfer(burner, BURN_ADDRESS, burnAmount);
  }
}




/**
 * ??Ethereum token.
 *
 * ??token??????owner.
 * owner?????token??????
 * owner????token
 *
 */
contract HLCToken is BurnableToken {

  string public name;  // Token??????Halal chain token
  string public symbol;  // Token??????HLC
  uint8 public decimals = 18;  // ??????? 18 ???????
  uint256 public totalSupply;
  function HLCToken(address _owner, string _name, string _symbol, uint _totalSupply, uint8 _decimals) {
    name = _name;
    symbol = _symbol;
    totalSupply = _totalSupply * 10 ** uint256(_decimals);
    decimals = _decimals;

    // ???token??????owner
    balances[_owner] = totalSupply;
  }
}