/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract AutoChainTokenCandy at 0xcb6e019e74a2d6e0dd60afc716e4c708140bff7d
*/
pragma solidity ^0.4.24;

contract AutoChainTokenCandyInface{

    function name() public constant returns (string );
    function  symbol() public constant returns (string );
    function  decimals()  public constant returns (uint8 );
    // ??token??????totalSupply().
    function  totalSupply()  public constant returns (uint256 );

    /// ????_owner??token??? 
    function  balanceOf(address _owner)  public constant returns (uint256 );

    //??????????_to??????_value?token
    function  transfer(address _to, uint256 _value) public returns (bool );

    //???_from????_to????_value?token??approve??????
    function  transferFrom(address _from, address _to, uint256 _value) public returns   
    (bool );

    //??????????_spender????????????_value?token
    function  approve(address _spender, uint256 _value) public returns (bool );

    //????_spender?????_owner???token???
    function  allowance(address _owner, address _spender) public constant returns 
    (uint256 );

    //????????????? 
    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    //???approve(address _spender, uint256 _value)????????????
    event Approval(address indexed _owner, address indexed _spender, uint256 
    _value);
}

contract AutoChainTokenCandy is AutoChainTokenCandyInface {

    /* private variables of the token */
    uint256 private _localtotalSupply;		//??
    string private _localname;                   //??: eg Simon Bucks
    uint8 private _localdecimals;               //????????How many decimals to show. ie. There could 1000 base units with 3 decimals. Meaning 0.980 SBX = 980 base units. It's like comparing 1 wei to 1 ether.
    string private _localsymbol;               //token??: eg SBX
    string private _localversion = '0.01';    //??

    address private _localowner; //????owner

    mapping (address => uint256) private balances;
    mapping (address => mapping (address => uint256)) private allowed;

    function  AutoChainTokenCandy() public {
        _localowner=msg.sender;		//?????owner
        balances[msg.sender] = 50000000000; // ??token?????????,???????????
        _localtotalSupply = 50000000000;         // ??????,???????????
        _localname = 'AutoChainTokenCandy';                   // token??
        _localdecimals = 4;           // ????
        _localsymbol = 'ATCx';             // token??
        
    }

    function getOwner() constant public returns (address ){
        return _localowner;
    }

    function  name() constant public returns (string ){
    	return _localname;
    }
    function  decimals() public constant returns (uint8 ){
    	return _localdecimals;
    }
    function  symbol() public constant returns (string ){
    	return _localsymbol;
    }
    function  version() public constant returns (string ){
    	return _localversion;
    }
    function  totalSupply() public constant returns (uint256 ){
    	return _localtotalSupply;
    }
    function  transfer(address _to, uint256 _value) public returns (bool ) {
        //??totalSupply ??????? (2^256 - 1).
        //??????????????token??????????????????
        require(balances[msg.sender] >= _value && balances[_to] + _value > balances[_to]);
        balances[msg.sender] -= _value;//???????????token??_value
        balances[_to] += _value;//???????token??_value
        emit Transfer(msg.sender, _to, _value);//????????
        return true;
    }
    function  transferFrom(address _from, address _to, uint256 _value) public returns 
    (bool ) {
        require(balances[_from] >= _value &&  balances[_to] + _value > balances[_to] && allowed[_from][msg.sender] >= _value);
        balances[_to] += _value;//??????token??_value
        balances[_from] -= _value; //????_from??token??_value
        allowed[_from][msg.sender] -= _value;//??????????_from????????_value
        emit Transfer(_from, _to, _value);//????????
        return true;
    }
    function  balanceOf(address _owner) public constant returns (uint256 ) {
        return balances[_owner];
    }
    function  approve(address _spender, uint256 _value) public returns (bool )   
    {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
    function  allowance(address _owner, address _spender) public constant returns (uint256 ) {
        return allowed[_owner][_spender];//??_spender?_owner????token?
    }
}