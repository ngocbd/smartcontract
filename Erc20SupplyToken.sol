/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Erc20SupplyToken at 0x824e5bf5ca24e8ae468f8c0e0ba1041f4c2f6518
*/
pragma solidity ^0.4.8;

  // ----------------------------------------------------------------------------------------------
  // Sample Erc20 supply token contract
  // Contract name:Erc20SupplyToken
  // Create params:uint256 _initialAmount, string _tokenName, uint8 _decimalUnits, string _tokenSymbol
  //          e.g.:100000000,"My company's Token",8,"TOK"
  // ----------------------------------------------------------------------------------------------

   // ERC Token Standard #20 Interface
  // https://github.com/ethereum/EIPs/issues/20
  contract ERC20Interface {
      // ???????
      function totalSupply() constant returns (uint256 totalSupply);

      // ?????????
      function balanceOf(address _owner) constant returns (uint256 balance);

      // ???????token
      function transfer(address _to, uint256 _value) returns (bool success);

      // ???????????????
      function transferFrom(address _from, address _to, uint256 _value) returns (bool success);

      //??_spender???????_value?????????????????DEX???????
      function approve(address _spender, uint256 _value) returns (bool success);

      // ??_spender?????_owner???????
      function allowance(address _owner, address _spender) constant returns (uint256 remaining);

      // token???????
      event Transfer(address indexed _from, address indexed _to, uint256 _value);

      // approve(address _spender, uint256 _value)?????
      event Approval(address indexed _owner, address indexed _spender, uint256 _value);
  }

   //????????
   contract Erc20SupplyToken is ERC20Interface {
      string public symbol; //??
      string public name; //??
      uint8 public decimals; //???????
      uint256 public _totalSupply; //????
      string public constant version = '1.0';    //??

      // ????????
      address public owner;

      // ???????
      mapping(address => uint256) balances;

      // ???????????????????????????????allowed[??????][??????]
      mapping(address => mapping (address => uint256)) allowed;

      // ???????????????????
      modifier onlyOwner() {
          if (msg.sender != owner) {
              throw;
          }
          _;
      }

      // ????,?????create??????:100000000,"My company's Token",8,"NOTRMB"
      function Erc20SupplyToken(uint256 _initialAmount, string _tokenName, uint8 _decimalUnits, string _tokenSymbol) {
          owner 						= msg.sender;
          balances[owner] 	= _initialAmount;
          
          _totalSupply 			= _initialAmount;         // ??????
          name 							= _tokenName;             // token??
          decimals 					= _decimalUnits;          // ????
          symbol 						= _tokenSymbol;           // token??          

      }

      function totalSupply() constant returns (uint256 totalSupply) {
          totalSupply = _totalSupply;
      }

      // ???????
      function balanceOf(address _owner) constant returns (uint256 balance) {
          return balances[_owner];
      }

      // ?????????
      function transfer(address _to, uint256 _amount) returns (bool success) {
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

      //???????????????????????????
      function transferFrom(
          address _from,
          address _to,
          uint256 _amount
      ) returns (bool success) {
          if (balances[_from] >= _amount
              && allowed[_from][msg.sender] >= _amount
              && _amount > 0
              && balances[_to] + _amount > balances[_to]) {
              balances[_from] -= _amount;
              allowed[_from][msg.sender] -= _amount;
              balances[_to] += _amount;
              Transfer(_from, _to, _amount);
              return true;
          } else {
              return false;
          }
      }

      //??????????????????????????
      function approve(address _spender, uint256 _amount) returns (bool success) {
          allowed[msg.sender][_spender] = _amount;
          Approval(msg.sender, _spender, _amount);
          return true;
      }

      //????????????
      function allowance(address _owner, address _spender) constant returns (uint256 remaining) {
          return allowed[_owner][_spender];
      }
  }