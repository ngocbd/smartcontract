/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract LhsToken at 0x6c52b059348d5ba7ec0959389163fe0634b85b04
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
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);  
}  
  
contract LhsToken is Token {  
  
    string public name;                   //?????"My test token"  
    uint8 public decimals;               //??token?????????????????3?????0.001??.  
    string public symbol;               //token??,like MTT  
    
    mapping (address => uint256) balances;  
    mapping (address => mapping (address => uint256)) allowed;  
    
    function LhsToken(uint256 _initialAmount, string _tokenName, uint8 _decimalUnits, string _tokenSymbol) public {  
        totalSupply = _initialAmount * 10 ** uint256(_decimalUnits);         // ??????  
        balances[msg.sender] = totalSupply; // ??token??????????????????????????????  
  
        name = _tokenName;                     
        decimals = _decimalUnits;            
        symbol = _tokenSymbol;  
    }  



    // token?????
    function _transferFunc(address _from, address _to, uint _value) internal {

        require(_to != 0x0);    // ?????
        require(balances[_from] >= _value);        // ?????????
        require(balances[_to] + _value > balances[_to]);  // ??????, ????????(hhhh)

        uint previousBalances = balances[_from] + balances[_to];  // ???????, ??????, ???????
        balances[_from] -= _value; //?? ???
        balances[_to] += _value;
        Transfer(_from, _to, _value);   // ?????????? , ??event
        assert(balances[_from] + balances[_to] == previousBalances);  // ????????, ??????
    }
  
    function transfer(address _to, uint256 _value) public  returns (bool success) {
        _transferFunc(msg.sender, _to, _value); // ??????? ????????, ???????????????
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= allowed[_from][msg.sender]);     // ?????, ?????????(???token??)
        allowed[_from][msg.sender] -= _value;
        _transferFunc(_from, _to, _value);
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
}