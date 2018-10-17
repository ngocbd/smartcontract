/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract HumanStandardToken at 0x59ebb83b72d735ac1ecb824cb3f8253fa5d49d00
*/
pragma solidity ^0.4.8;
contract Token{
    // token???????public??????getter????????totalSupply().
    uint256 public totalSupply;  //??
    uint256 public teamlock;  //????
    uint256 public foundationlock;//?????
    uint256 public mininglock;//????
    uint256 public releaseTime;//????
    uint256 public starttime;//?????
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

contract StandardToken is Token {
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

contract HumanStandardToken is StandardToken { 

    /* Public variables of the token */
    string public name;                 //??: 
    uint8 public decimals;              //???????
    string public symbol;               //token??
   
    string public version = 'H0.1';    //??

    function HumanStandardToken() {
        //balances[msg.sender] = _initialAmount; // ??token?????????
       
        totalSupply          =1000000000;  //??
        balances[msg.sender] =300000000;   //????
        teamlock             =150000000;   //????
        foundationlock       =100000000;   //?????
        mininglock           =450000000;   //????
        name = 'DPSChain token';           //token??
        decimals = 0;                      //????
        symbol = 'DPST';                   // token??
        releaseTime=365*3*24*60*60;        //????
        starttime=block.timestamp;
       
    }
    
      
    function unlocktoken(address _team, address _foundation, address _mining) returns 
    (bool success) {
        //require(block.timestamp >= releaseTime);
        require(block.timestamp >= starttime+releaseTime);
        require(teamlock > 0);
        require(foundationlock > 0);
        require(mininglock > 0);
        
         balances[_team] +=teamlock;  //????
         teamlock-=150000000;
         Transfer(this, _team, teamlock);//????????
         
        balances[_foundation] +=foundationlock;//?????
        foundationlock-=100000000;
        Transfer(this, _foundation, foundationlock);//????????
        
        
        balances[_mining] +=mininglock;//????
         mininglock-=450000000;
        Transfer(this, _mining, mininglock);//????????
        
        return true;
    }
    
   

    /* Approves and then calls the receiving contract */
    
    function approveAndCall(address _spender, uint256 _value, bytes _extraData) returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        //call the receiveApproval function on the contract you want to be notified. This crafts the function signature manually so one doesn't have to include a contract in here just for this.
        //receiveApproval(address _from, uint256 _value, address _tokenContract, bytes _extraData)
        //it is assumed that when does this that the call *should* succeed, otherwise one would use vanilla approve instead.
        require(_spender.call(bytes4(bytes32(sha3("receiveApproval(address,uint256,address,bytes)"))), msg.sender, _value, this, _extraData));
        return true;
    }

}