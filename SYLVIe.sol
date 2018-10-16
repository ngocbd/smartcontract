/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract SYLVIe at 0x5b0cf947B24434d116373677e1c41145Fa4DACB5
*/
pragma solidity ^0.4.8;

// ERC20?????????            url:https://github.com/ConsenSys/Tokens/blob/master/Token_Contracts/contracts/StandardToken.sol
contract SYLVIe {

  function () {
      //if ether is sent to this address, send it back.
      throw;
  }

  string public name = "SYLVIe";                              // ?????
  uint8 public decimals = 0;                                  // ????????
  string public symbol = "SLV";                               // ???????
  uint256 public totalSupply = 100000000;                     // ????
  mapping (address => uint256) balances;                      // ??????????????????
  mapping (address => mapping (address => uint256)) allowed;  // ?1?????????2??????????????????????

  event Transfer(address indexed from, address indexed to, uint value);
  event Approval(address indexed owner, address indexed spender, uint value);

  function SYLVIe() {
    balances[msg.sender] = totalSupply;
  }

  function transfer(address _to, uint256 _value) returns (bool success) {
      if (balances[msg.sender] >= _value && _value > 0) {
          balances[msg.sender] -= _value;
          balances[_to] += _value;
          Transfer(msg.sender, _to, _value);
          return true;
      } else { return false; }
  }

  function transferFrom(address _from, address _to, uint256 _value) returns (bool success) {
      if (balances[_from] >= _value && allowed[_from][msg.sender] >= _value && _value > 0) {
          balances[_to] += _value;
          balances[_from] -= _value;
          allowed[_from][msg.sender] -= _value;
          Transfer(_from, _to, _value);
          return true;
      } else { return false; }
  }

  function balanceOf(address _owner) constant returns (uint256 balance) {
    return balances[_owner];
  }

  function approve(address _spender, uint256 _value) returns (bool success) {
    allowed[msg.sender][_spender] = _value;
    Approval(msg.sender, _spender, _value);
    return true;
  }

  function allowance(address _owner, address _spender) constant returns (uint256 remaining) {
    return allowed[_owner][_spender];
  }
}