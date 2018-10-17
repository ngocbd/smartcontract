/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Token at 0x78367b03722c8008917d047ce848ed1a869d3d68
*/
pragma solidity 0.4.24;

/**
 * title ERC20 interface
 * see https://github.com/ethereum/EIPs/issues/20
 */
contract ERC20Token{
  uint256 public totalSupply;
  mapping (address => uint256) public balanceOf;
  mapping (address => mapping (address => uint256)) public allowance;
  function transfer(address to, uint256 value) public returns (bool);
  function transferFrom(address from, address to, uint256 value) public returns (bool);
  function approve(address spender, uint256 value) public returns (bool);
  event Transfer(address indexed from, address indexed to, uint256 value);
  event Approval(address indexed owner, address indexed spender, uint256 value);
}


/**
 * title Standard ERC20 token
 *
 * Implementation of the basic standard token.
 * https://github.com/ethereum/EIPs/issues/20
 */
contract StandardToken is ERC20Token{
  string public version = "1.0";
  string public name = "eleven-dimensional resonnance";
  string public symbol = "R11";
  uint8 public  decimals = 18;

  bool public transfersEnabled = true;

  /**
   * to stop this contract
   */
  modifier transable(){
      require(transfersEnabled);
      _;
  }

  function transfer(address _to, uint256 _value) transable public returns (bool) {
    require(_to != address(0)&&_value>0);
    require(balanceOf[msg.sender]>_value);
    balanceOf[msg.sender] -= _value;
    balanceOf[_to] += _value;
    emit Transfer(msg.sender, _to, _value);
    return true;
  }

  /**
   * Transfer tokens from one address to another
   * param _from address The address which you want to send tokens from
   * param _to address The address which you want to transfer to
   * param _value uint256 the amount of tokens to be transferred
   */
  function transferFrom(address _from, address _to, uint256 _value) transable public returns (bool) {
    require(_to != address(0)&&_value>0);

    uint256 _allowance = allowance[_from][msg.sender];

    require (_value <= _allowance);
    require(balanceOf[_from]>_value);

    balanceOf[_from] -= _value;
    balanceOf[_to] += _value;
    allowance[_from][msg.sender] -= _value;
    emit Transfer(_from, _to, _value);
    return true;
  }

  /**
   * Approve the passed address to spend the specified amount of tokens on behalf of msg.sender.
   * 
   * param _spender The address which will spend the funds.
   * param _value The amount of tokens to be spent.
   */
  function approve(address _spender, uint256 _value) public returns (bool) {
    require(allowance[msg.sender][_spender]==0);
    allowance[msg.sender][_spender] = _value;
    emit Approval(msg.sender, _spender, _value);
    return true;
  }


  /**
   * approve should be called only first. To increment
   * allowed value is better to use this function
   */
  function increaseApproval (address _spender, uint _addedValue) public returns (bool success) {
    allowance[msg.sender][_spender] += _addedValue;
    emit Approval(msg.sender, _spender, allowance[msg.sender][_spender]);
    return true;
  }

  function decreaseApproval (address _spender, uint _subtractedValue) public returns (bool success) {
    uint oldValue = allowance[msg.sender][_spender];
    if (_subtractedValue > oldValue) {
      allowance[msg.sender][_spender] = 0;
    } else {
      allowance[msg.sender][_spender] -= _subtractedValue;
    }
    emit Approval(msg.sender, _spender, allowance[msg.sender][_spender]);
    return true;
  }

}



// This is just a contract of a BOP Token.
// It is a ERC20 token
contract Token is StandardToken{

    //????
    uint  currUnlockStep; //????step
    uint256 currUnlockSeq; //????step ????

    //Key1: step(????); Key2: user sequence(????)
    mapping (uint => uint256[]) public freezeOf; //?????????????uint256???????
    mapping (uint => bool) public stepUnlockInfo; //?????key ?????????value,??????
    mapping (address => uint256) public freezeOfUser; //???????????????????
    
   
    uint256 internal constant INITIAL_SUPPLY = 1 * (10**8) * (10 **18);


    event Burn(address indexed burner, uint256 value);
    event Freeze(address indexed locker, uint256 value);
    event Unfreeze(address indexed unlocker, uint256 value);
    event TransferMulti(uint256 count, uint256 total);

    constructor() {
        owner = msg.sender;
        balanceOf[owner] = INITIAL_SUPPLY;
        totalSupply = INITIAL_SUPPLY;
    }

    // transfer to and lock it
    function transferAndLock(address _to, uint256 _value, uint256 _lockValue, uint _step) transable public returns (bool success) {
        require(_to != 0x0);
        require(_value <= balanceOf[msg.sender]);
        require(_value > 0);

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        emit Transfer(msg.sender, _to, _value);
        freeze(_to, _lockValue, _step);
        return true;
    }

    // transfer to and lock it
    function transferFromAndLock(address _from, address _to, uint256 _value, uint256 _lockValue, uint _step) transable public returns (bool success) {
        uint256 _allowance = allowance[_from][msg.sender];

        require (_value <= _allowance);
        require(_to != 0x0);
        require(_value <= balanceOf[_from]);

        allowance[_from][msg.sender] -= _value;
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;

        emit Transfer(_from, _to, _value);
        freeze(_to, _lockValue, _step);
        return true;
    }


    function transferMulti(address[] _to, uint256[] _value) transable public returns (uint256 amount){
        require(_to.length == _value.length && _to.length <= 1024);
        uint256 balanceOfSender = balanceOf[msg.sender];
        uint256 len = _to.length;
        for(uint256 j; j<len; j++){
            require(_value[j] <= balanceOfSender); //limit transfer value
            require(amount <= balanceOfSender);
            amount += _value[j];
        }
        require(balanceOfSender >= amount); //check enough and not overflow
        balanceOf[msg.sender] -= amount;
        for(uint256 i; i<len; i++){
            address _toI = _to[i];
            uint256 _valueI = _value[i];
            balanceOf[_toI] += _valueI;
            emit Transfer(msg.sender, _toI, _valueI);
        }
        emit TransferMulti(len, amount);
    }
    
    //????
    function freeze(address _user, uint256 _value, uint _step) internal returns (bool success) {
        require(balanceOf[_user] >= _value);
        balanceOf[_user] -= _value;
        freezeOfUser[_user] += _value;
        freezeOf[_step].push(uint256(_user)<<92|_value);
        emit Freeze(_user, _value);
        return true;
    }


    //event ShowStart(uint256 start);

    //?????????
    function unFreeze(uint _step) onlyOwner public returns (bool unlockOver) {
        require(currUnlockStep==_step || currUnlockSeq==uint256(0));
        require(stepUnlockInfo[_step]==false);
        uint256[] memory currArr = freezeOf[_step];
        currUnlockStep = _step;
        if(currUnlockSeq==uint256(0)){
            currUnlockSeq = currArr.length;
        }

        uint256 userLockInfo;
        uint256 _amount;
        address userAddress;

        for(uint i = 0; i<99&&currUnlockSeq>0; i++){
            userLockInfo = freezeOf[_step][currUnlockSeq-1];
            _amount = userLockInfo&0xFFFFFFFFFFFFFFFFFFFFFFF;
            userAddress = address(userLockInfo>>92);
            if(freezeOfUser[userAddress]>= _amount){
              balanceOf[userAddress] += _amount;
              freezeOfUser[userAddress] -= _amount;
              emit Unfreeze(userAddress, _amount);
            }
            
            currUnlockSeq--;
        }
        if(currUnlockSeq==0){
            stepUnlockInfo[_step] = true;
        }
        return true;
    }


    //?????????
    function unFreezeUser(address _user) onlyOwner public returns (bool unlockOver) {
        require(_user != address(0));
        
        uint256 _amount = freezeOfUser[_user];
        if(_amount>0){
          balanceOf[_user] += _amount;
          delete freezeOfUser[_user];
          emit Unfreeze(_user, _amount);
        }
           
        return true;
    }


    /**
     * Burns a specific amount of tokens.
     * param _value The amount of token to be burned.
     */
    function burn(uint256 _value) transable public returns (bool success) {
        require(_value > 0);
        require(_value <= balanceOf[msg.sender]);
   
        balanceOf[msg.sender] -= _value;
        totalSupply -= _value;
        emit Burn(msg.sender, _value);
        return true;
    }



    /**
     * dev Function to mint tokens
     * param _to The address that will receive the minted tokens.
     * param _amount The amount of tokens to mint.
     * return A boolean that indicates if the operation was successful.
     */
    function enableTransfers(bool _transfersEnabled) onlyOwner public {
      transfersEnabled = _transfersEnabled;
    }


    address public owner;

    event ChangeOwner(address indexed previousOwner, address indexed newOwner);


    /**
     * revert if called by any account except owner.
     */
    modifier onlyOwner() {
      require(msg.sender == owner);
      _;
    }


    /**
     * Allows the current owner to transfer control of the contract to a newOwner.
     * param newOwner The address to transfer ownership to.
     */
    function changeOwner(address newOwner) onlyOwner public {
      require(newOwner != address(0));
      owner = newOwner;
      emit ChangeOwner(owner, newOwner);
    }
}