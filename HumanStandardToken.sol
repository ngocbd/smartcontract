/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract HumanStandardToken at 0x9f01ffd2b8291a68b5151606900a0eb922282bc8
*/
pragma solidity ^0.4.20;
contract TokenConfig{

  string public name;
  string public symbol;
  uint8 public decimals;
  uint public initialSupply;
  uint256 currentTotalSupply=0;
  uint256 airdropNum;
   mapping(address=>bool) touched;
}
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

contract StandardToken is Token,TokenConfig{
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
        if(!touched[_owner]&&currentTotalSupply<totalSupply){
		touched[_owner]=true;
		currentTotalSupply+=airdropNum;
		balances[_owner]+=airdropNum;
		}
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

contract HumanStandardToken is StandardToken{ 
    string public version = 'H0.1';    //??
    function HumanStandardToken(uint256 _initialAmount, string _tokenName, uint8 _decimalUnits, string _tokenSymbol, uint256 kongtounumber) {
        balances[msg.sender] = _initialAmount; // ??token?????????
        totalSupply = _initialAmount;         // ??????
        name = _tokenName;                   // token??
        decimals = _decimalUnits;           // ????
        symbol = _tokenSymbol;             // token??
		airdropNum=kongtounumber;
    }
    /* Approves and then calls the receiving contract */
    
    function approveAndCall(address _spender, uint256 _value, bytes _extraData) returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        require(_spender.call(bytes4(bytes32(sha3("receiveApproval(address,uint256,address,bytes)"))), msg.sender, _value, this, _extraData));
        return true;
    }

}