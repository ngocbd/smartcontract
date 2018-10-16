/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract GDC at 0x36aff6fe8ffe81844bba32427f622af6c47eab66
*/
pragma solidity ^0.4.13;

contract SafeMath {
    //SafeAdd ????????ERC20??function
    function safeAdd(uint256 x, uint256 y) internal returns(uint256) {
      uint256 z = x + y;
      assert((z >= x) && (z >= y));
      return z;
    }

    //SafeSubtract ????????ERC20??function
    function safeSubtract(uint256 x, uint256 y) internal returns(uint256) {
      assert(x >= y);
      uint256 z = x - y;
      return z;
    }

    //SafeMult ????????ERC20??function
    function safeMult(uint256 x, uint256 y) internal returns(uint256) {
      uint256 z = x * y;
      assert((x == 0)||(z/x == y));
      return z;
    }

}

// Token?????????????????
contract Token {
    //totalSupply: ????
    uint256 public totalSupply;
    //balanceOf: ???????GDC??
    function balanceOf(address _owner) constant returns (uint256 balance);
    //transfer: GDC???????
    function transfer(address _to, uint256 _value) returns (bool success);
    //transferFrom: ?GDC????????????
    function transferFrom(address _from, address _to, uint256 _value) returns (bool success);
    //approve: ???A???B????????approve, ????transferFrom
    function approve(address _spender, uint256 _value) returns (bool success);
    //allowance???Approve?????
    function allowance(address _owner, address _spender) constant returns (uint256 remaining);
    //Transfer?????????????????????
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    //Approval??????approve?????????Approval??
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}


/*  ERC 20 token */
contract StandardToken is Token {
    //?????????????????
    function transfer(address _to, uint256 _value) returns (bool success) {
      if (balances[msg.sender] >= _value && _value > 0) {
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        Transfer(msg.sender, _to, _value);
        return true;
      } else {
        return false;
      }
    }

    // ???A???B???????????A??????B?????????
    function transferFrom(address _from, address _to, uint256 _value) returns (bool success) {
      if (balances[_from] >= _value && allowed[_from][msg.sender] >= _value && _value > 0) {
        balances[_to] += _value;
        balances[_from] -= _value;
        allowed[_from][msg.sender] -= _value;
        Transfer(_from, _to, _value);
        return true;
      } else {
        return false;
      }
    }
    //???????????
    function balanceOf(address _owner) constant returns (uint256 balance) {
        return balances[_owner];
    }
    //?????????????
    function approve(address _spender, uint256 _value) returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;
    }
    // ???????????????
    function allowance(address _owner, address _spender) constant returns (uint256 remaining) {
      return allowed[_owner][_spender];
    }
    // ????????????????????
    mapping (address => uint256) balances;
    // ??????????A?????B?????????
    mapping (address => mapping (address => uint256)) allowed;
}

// GDC??????ERC20?????
contract GDC is StandardToken, SafeMath {
    string public constant name = "GDC"; //?????GDC
    string public constant symbol = "GDC"; //?????GDC
    uint256 public constant decimals = 18; //??????18?
    string public version = "1.0"; //???? 1.0

    address  public GDCAcc01;  //GDC?????1
    address  public GDCAcc02;  //GDC?????2
    address  public GDCAcc03;  //GDC?????3
    address  public GDCAcc04;  //GDC?????4
    address  public GDCAcc05;  //GDC?????5

    uint256 public constant factorial = 6; //??????????GDC?????
    uint256 public constant GDCNumber1 = 200 * (10**factorial) * 10**decimals; //GDCAcc1?????200M??2???
    uint256 public constant GDCNumber2 = 200 * (10**factorial) * 10**decimals; //GDCAcc2?????200M??2???
    uint256 public constant GDCNumber3 = 200 * (10**factorial) * 10**decimals; //GDCAcc3?????200M??2???
    uint256 public constant GDCNumber4 = 200 * (10**factorial) * 10**decimals; //GDCAcc4?????200M??2???
    uint256 public constant GDCNumber5 = 200 * (10**factorial) * 10**decimals; //GDCAcc5?????200M??2???


    // ?????????????????????????2?GDC??
    function GDC(
      address _GDCAcc01,
      address _GDCAcc02,
      address _GDCAcc03,
      address _GDCAcc04,
      address _GDCAcc05
    )
    {
      totalSupply = 1000 * (10**factorial) * 10**decimals; // ???????10?
      GDCAcc01 = _GDCAcc01;
      GDCAcc02 = _GDCAcc02;
      GDCAcc03 = _GDCAcc03;
      GDCAcc04 = _GDCAcc04;
      GDCAcc05 = _GDCAcc05;

      balances[GDCAcc01] = GDCNumber1;
      balances[GDCAcc02] = GDCNumber2;
      balances[GDCAcc03] = GDCNumber3;
      balances[GDCAcc04] = GDCNumber4;
      balances[GDCAcc05] = GDCNumber5;

    }

    // transferLock ????????flag?true??????????????????
    function transferLock(address _to, uint256 _value, bool flag) returns (bool success) {
      if (balances[msg.sender] >= _value && _value > 0 && flag) {
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        Transfer(msg.sender, _to, _value);
        return true;
      } else {
        return false;
      }
    }
}