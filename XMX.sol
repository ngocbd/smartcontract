/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract XMX at 0xd33ec1d20bd4abe067efa432a66c94ea3ba9f0f8
*/
pragma solidity ^0.4.20;

interface tokenRecipient { 
    function receiveApproval(address _from, uint256 _value, address _token, bytes _extraData) external; 
    
}

contract owned {
    address public owner;
   
    constructor () public{
        owner = msg.sender;
    }
   
    modifier onlyOwner {
        require (msg.sender == owner);
        _;
    }
  
    function transferOwnership(address newOwner) onlyOwner public{
        owner = newOwner;
    }
}

contract token {
    
    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;
  
    event Transfer(address indexed from, address indexed to, uint256 value);  //??????

    constructor () public{
      
    }

    function _transfer(address _from, address _to, uint256 _value) internal {
      //????????0x0
      require(_to != 0x0);
      //?????????????
      require(balanceOf[_from] >= _value);
      //??????
      require(balanceOf[_to] + _value > balanceOf[_to]);
      //???????????
      uint previousBalances = balanceOf[_from] + balanceOf[_to];
      //?????????
      balanceOf[_from] -= _value;
      //??????????
      balanceOf[_to] += _value;
      //?????????????
      emit Transfer(_from, _to, _value);
      //??????????????????
      assert(balanceOf[_from] + balanceOf[_to] == previousBalances);
    }
  
    function transfer(address _to, uint256 _value) public {
        _transfer(msg.sender, _to, _value);
    }
    
    function transferFrom(address _from, address _to, uint256 _value)public returns (bool success) {
        //?????????????
        require(_value <= allowance[_from][msg.sender]);   // Check allowance
        allowance[_from][msg.sender] -= _value;
        _transfer(_from, _to, _value);
        return true;
    }
  
    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        return true;
    }
 
    function approveAndCall(address _spender, uint256 _value, bytes _extraData) public returns (bool success) {
        tokenRecipient spender = tokenRecipient(_spender);
        if (approve(_spender, _value)) {
            spender.receiveApproval(msg.sender, _value, this, _extraData);
            return true;
        }
    }
  
    
}

contract XMX is owned, token {
    string public name = 'China dragon'; //????
    string public symbol = 'CYT3'; //??????'$'
    uint8 public decimals = 18;  //????????????????0,??????????18?0
    uint256 public totalSupply; //????
    uint256 initialSupply =0;
  
    //?????????
    mapping (address => bool) public frozenAccount;
    //??????????????????????????????
    event FrozenFunds(address target, bool frozen);
    event Burn(address indexed from, uint256 value);  //????????
   
    constructor () token () public {
        //?????
        totalSupply = initialSupply * 10 ** uint256(decimals);    //????10^18???18?0?????decimals?18
        //?????????????????????????
        //balanceOf[msg.sender] = totalSupply;
        balanceOf[this] = totalSupply;
        //????????
        //if(centralMinter != 0 ) owner = centralMinter;
      
    }
    
    function _transfer(address _from, address _to, uint _value) internal {
        //????????0x0
        require (_to != 0x0);
        //?????????????
        require (balanceOf[_from] > _value);
        //??????
        require (balanceOf[_to] + _value > balanceOf[_to]);
        //?? ????
        require(!frozenAccount[_from]);
        require(!frozenAccount[_to]);
        //?????????
        balanceOf[_from] -= _value;
        //??????????
        balanceOf[_to] += _value;
        //?????????????
        emit Transfer(_from, _to, _value);
    }
    
    function mintToken(address target, uint256 mintedAmount) onlyOwner public {
        //?????????????????
        balanceOf[target] += mintedAmount;
        totalSupply += mintedAmount;
        emit Transfer(0, this, mintedAmount);
        emit Transfer(this, target, mintedAmount);
    }
    
    function freezeAccount(address target, bool freeze) onlyOwner public {
        frozenAccount[target] = freeze;
        emit FrozenFunds(target, freeze);
    }
    
    function burn(uint256 _value) public returns (bool success) {
        //???????????????
        require(balanceOf[msg.sender] >= _value);   // Check if the sender has enough
        //?????????
        balanceOf[msg.sender] -= _value;
        //?????????
        totalSupply -= _value;
        emit Burn(msg.sender, _value);
        return true;
    }
  
    function burnFrom(address _from, uint256 _value) public returns (bool success) {
        //???????????????
        require(balanceOf[_from] >= _value);
        //?? ???? ????????
        require(_value <= allowance[_from][msg.sender]);
        //????
        balanceOf[_from] -= _value;
        allowance[_from][msg.sender] -= _value;
        //????
        totalSupply -= _value;
        emit Burn(_from, _value);
        return true;
    }
    
   
}