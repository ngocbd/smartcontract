/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract LiSaoToken at 0x9a5dcd4348549d719813431f10fbb6d1c1758d83
*/
pragma solidity ^0.4.24;
/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
   ????????
 */
library SafeMath {
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a * b;
    assert(a == 0 || c / a == b);
    return c;
  }
 
  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return c;
  }
 
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }
 
  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}

contract StandardToken {
	//??SafeMath
    using SafeMath for uint256;
   
    //????
    string public name;
    //????
    string public symbol;
	//??????(???????????)
    uint8 public  decimals;
	//????
	uint256 public totalSupply;
   
	//??????(?????????????????)?_value????????_to??
    function transfer(address _to, uint256 _value) public returns (bool success);

    //?_from?????_value??????_to??
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);

	//???????_value???????????_spender???_spender????transferFrom????????????????
    function approve(address _spender, uint256 _value) public returns (bool success);

	//??_spender??????_owner????????
    function allowance(address _owner, address _spender) public constant returns (uint256 remaining);

	//???????
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
	//??????????
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}

//????????????
contract Owned {

    // modifier(??)?????????????do something???administrator???
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;//do something 
    }

	//?????
    address public owner;

	//????????????????????owner
    constructor() public {
        owner = msg.sender;
    }
	//??owner,?????????null
    address newOwner=0x0;

	//??owner?????
    event OwnerUpdate(address _prevOwner, address _newOwner);

    //??owner????????owner(????owner??acceptOwnership??????)
    function changeOwner(address _newOwner) public onlyOwner {
        require(_newOwner != owner);
        newOwner = _newOwner;
    }

    //??owner?????,????????
    function acceptOwnership() public{
        require(msg.sender == newOwner);
        emit OwnerUpdate(owner, newOwner);
        owner = newOwner;
        newOwner = 0x0;
    }
}

//???????
contract Controlled is Owned{

	//??vip
    constructor() public {
       setExclude(msg.sender,true);
    }

    // ???????????true????(exclude??????????????????transferAllowed?)
    bool public transferEnabled = true;

    // ???????????true????
    bool lockFlag=true;
	// ????????address???bool?????true:?????lockFlag=true??????????????
    mapping(address => bool) locked;
	// ?????????transferEnabled?lockFlag????vip??bool?true??vip??
    mapping(address => bool) exclude;

	//??transferEnabled?
    function enableTransfer(bool _enable) public onlyOwner returns (bool success){
        transferEnabled=_enable;
		return true;
    }

	//??lockFlag?
    function disableLock(bool _enable) public onlyOwner returns (bool success){
        lockFlag=_enable;
        return true;
    }

	// ?_addr???????????????
    function addLock(address _addr) public onlyOwner returns (bool success){
        require(_addr!=msg.sender);
        locked[_addr]=true;
        return true;
    }

	//??vip??
    function setExclude(address _addr,bool _enable) public onlyOwner returns (bool success){
        exclude[_addr]=_enable;
        return true;
    }

	//??_addr??
    function removeLock(address _addr) public onlyOwner returns (bool success){
        locked[_addr]=false;
        return true;
    }
	//???? ????
    modifier transferAllowed(address _addr) {
        if (!exclude[_addr]) {
            require(transferEnabled,"transfer is not enabeled now!");
            if(lockFlag){
                require(!locked[_addr],"you are locked!");
            }
        }
        _;
    }

}

//????????
contract LiSaoToken is StandardToken,Controlled {

	//????
	mapping (address => uint256) public balanceOf;
	mapping (address => mapping (address => uint256)) internal allowed;
	
	constructor() public {
        totalSupply = 1000000000;//10?
        name = "LiSao Token";
        symbol = "LS";
        decimals = 0;
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address _to, uint256 _value) public transferAllowed(msg.sender) returns (bool success) {
		require(_to != address(0));
		require(_value <= balanceOf[msg.sender]);

        balanceOf[msg.sender] = balanceOf[msg.sender].sub(_value);
        balanceOf[_to] = balanceOf[_to].add(_value);
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public transferAllowed(_from) returns (bool success) {
		require(_to != address(0));
        require(_value <= balanceOf[_from]);
        require(_value <= allowed[_from][msg.sender]);

        balanceOf[_from] = balanceOf[_from].sub(_value);
        balanceOf[_to] = balanceOf[_to].add(_value);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
        emit Transfer(_from, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
      return allowed[_owner][_spender];
    }

}