/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract ECF at 0x11c0d500bd2b1b4434df8b400cf6fa62f1c5a1b1
*/
pragma solidity ^0.4.16;

interface tokenRecipient { function receiveApproval(address _from, uint256 _value, address _token, bytes _extraData) external; }

contract ECF {
	using SafeMath for uint256;
    string public name;
    string public symbol;
    uint8 public decimals;  // decimals ??????????????????18 ???????
    uint256 public totalSupply;
	address public owner;
	

    // ?mapping???????????
    mapping (address => uint256) public balanceOf;
    // ????????
    mapping (address => mapping (address => uint256)) public allowance;
	mapping (address => uint256) public freezeOf;

    // ??????????????
    event Transfer(address indexed from, address indexed to, uint256 value);

    // ???????????????
    event Burn(address indexed from, uint256 value);
    
    //????????????????????
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
	
	/* ?? */
    event Freeze(address indexed from, uint256 value);
	
	/* ?? */
    event Unfreeze(address indexed from, uint256 value);

    /**
     * ?????
     */
    constructor(uint256 initialSupply, string tokenName, string tokenSymbol, uint8 uintDecimal) public {
        decimals = uintDecimal;
		totalSupply = initialSupply * 10 ** uint256(uintDecimal);  // ????????????????????? = ?? * 10 ** decimals?
        balanceOf[msg.sender] = totalSupply;                // ??????????
        name = tokenName;                                   // ????
        symbol = tokenSymbol;                               // ????
		owner = msg.sender;
	}
	
	modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address newOwner) onlyOwner public {
		require(newOwner != address(0));
        owner = newOwner;
    }

    /**
     * ???????????
     */
    function _transfer(address _from, address _to, uint _value) internal {
        // ????????0x0???0x0??????
        require(_to != 0x0);
        // ???????
        require(balanceOf[_from] >= _value);
        // ????????
        require(balanceOf[_to] + _value > balanceOf[_to]);

        // ?????????
        uint previousBalances = balanceOf[_from] + balanceOf[_to];
        // Subtract from the sender
        balanceOf[_from] = balanceOf[_from].sub(_value);
        // Add the same to the recipient
        balanceOf[_to] = balanceOf[_to].add(_value);
        emit Transfer(_from, _to, _value);

        // ?assert????????
        assert(balanceOf[_from] + balanceOf[_to] == previousBalances);
    }

    /**
     *  ??????
     * ??????????`_value`????? `_to`??
     *
     * @param _to ?????
     * @param _value ????
     */
    function transfer(address _to, uint256 _value) public {
        _transfer(msg.sender, _to, _value);
    }

    /**
     * ??????????
     * @param _from ?????
     * @param _to ?????
     * @param _value ????
     */
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= allowance[_from][msg.sender]);     // Check allowance
        allowance[_from][msg.sender] = allowance[_from][msg.sender].sub(_value);
        _transfer(_from, _to, _value);
        return true;
    }

    /**
     * ????????????????????????
     *
     * ?????`_spender` ????? `_value` ????
     *
     * @param _spender The address authorized to spend
     * @param _value the max amount they can spend
     */
    function approve(address _spender, uint256 _value) public
        returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender,_spender,_value);
        return true;
    }

    /**
     * ????????????????????????????
     *
     * @param _spender ??????????
     * @param _value ????????
     * @param _extraData ??????????
     */
    function approveAndCall(address _spender, uint256 _value, bytes _extraData)
        public
        returns (bool success) {
        tokenRecipient spender = tokenRecipient(_spender);
        if (approve(_spender, _value)) {
            spender.receiveApproval(msg.sender, _value, this, _extraData);
            return true;
        }
    }

    /**
     * ?????????????
     */
    function burn(uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value);   // Check if the sender has enough
        balanceOf[msg.sender] = balanceOf[msg.sender].sub(_value);            // Subtract from the sender
        totalSupply = totalSupply.sub(_value);                      // Updates totalSupply
        emit Burn(msg.sender, _value);
        return true;
    }

    /**
     * ????????????
     *
     * Remove `_value` tokens from the system irreversibly on behalf of `_from`.
     *
     * @param _from the address of the sender
     * @param _value the amount of money to burn
     */
    function burnFrom(address _from, uint256 _value) public returns (bool success) {
        require(balanceOf[_from] >= _value);                // Check if the targeted balance is enough
        require(_value <= allowance[_from][msg.sender]);    // Check allowance
        balanceOf[_from] = balanceOf[_from].sub(_value);                         // Subtract from the targeted balance
        allowance[_from][msg.sender] = allowance[_from][msg.sender].sub(_value);             // Subtract from the sender's allowance
        totalSupply = totalSupply.sub(_value);                              // Update totalSupply
        emit Burn(_from, _value);
        return true;
    }
	//??
	function mintToken(address target, uint256 mintedAmount) public onlyOwner {
        balanceOf[target] = balanceOf[target].add(mintedAmount);
        totalSupply = totalSupply.add(mintedAmount);
        emit Transfer(0, owner, mintedAmount);
        emit Transfer(owner, target, mintedAmount);
    }
	//??
	function freeze(address target,uint256 _value) onlyOwner public returns (bool success) {
        if (balanceOf[target] < _value) revert();            // Check if the sender has enough
		if (_value <= 0) revert(); 
        balanceOf[target] = balanceOf[target].sub(_value);                      // Subtract from the sender
        freezeOf[target] = freezeOf[target].add(_value);                                // Updates totalSupply
        emit Freeze(target, _value);
        return true;
    }
	//??
	function unfreeze(address target,uint256 _value) onlyOwner public returns (bool success) {
        if (freezeOf[target] < _value) revert();            // Check if the sender has enough
		if (_value <= 0) revert(); 
        freezeOf[target] = freezeOf[target].sub(_value);                      // Subtract from the sender
		balanceOf[target] = balanceOf[target].add(_value);
        emit Unfreeze(target, _value);
        return true;
    }
	
	// can accept ether
	function() payable public{
    }
}

/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {

  /**
  * @dev Multiplies two numbers, throws on overflow.
  */
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }

  /**
  * @dev Integer division of two numbers, truncating the quotient.
  */
  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return c;
  }

  /**
  * @dev Substracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
  */
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  /**
  * @dev Adds two numbers, throws on overflow.
  */
  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}