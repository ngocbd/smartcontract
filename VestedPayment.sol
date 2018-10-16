/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract VestedPayment at 0xed7eabc86201e647e37bb53419a7ad69bfc5b944
*/
pragma solidity ^0.4.18;

// File: zeppelin-solidity/contracts/ownership/Ownable.sol

/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
  address public owner;


  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);


  /**
   * @dev The Ownable constructor sets the original `owner` of the contract to the sender
   * account.
   */
  function Ownable() public {
    owner = msg.sender;
  }

  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  /**
   * @dev Allows the current owner to transfer control of the contract to a newOwner.
   * @param newOwner The address to transfer ownership to.
   */
  function transferOwnership(address newOwner) public onlyOwner {
    require(newOwner != address(0));
    OwnershipTransferred(owner, newOwner);
    owner = newOwner;
  }

}

// File: zeppelin-solidity/contracts/math/SafeMath.sol

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

// File: zeppelin-solidity/contracts/token/ERC20/ERC20Basic.sol

/**
 * @title ERC20Basic
 * @dev Simpler version of ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/179
 */
contract ERC20Basic {
  function totalSupply() public view returns (uint256);
  function balanceOf(address who) public view returns (uint256);
  function transfer(address to, uint256 value) public returns (bool);
  event Transfer(address indexed from, address indexed to, uint256 value);
}

// File: zeppelin-solidity/contracts/token/ERC20/BasicToken.sol

/**
 * @title Basic token
 * @dev Basic version of StandardToken, with no allowances.
 */
contract BasicToken is ERC20Basic {
  using SafeMath for uint256;

  mapping(address => uint256) balances;

  uint256 totalSupply_;

  /**
  * @dev total number of tokens in existence
  */
  function totalSupply() public view returns (uint256) {
    return totalSupply_;
  }

  /**
  * @dev transfer token for a specified address
  * @param _to The address to transfer to.
  * @param _value The amount to be transferred.
  */
  function transfer(address _to, uint256 _value) public returns (bool) {
    require(_to != address(0));
    require(_value <= balances[msg.sender]);

    // SafeMath.sub will throw if there is not enough balance.
    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    Transfer(msg.sender, _to, _value);
    return true;
  }

  /**
  * @dev Gets the balance of the specified address.
  * @param _owner The address to query the the balance of.
  * @return An uint256 representing the amount owned by the passed address.
  */
  function balanceOf(address _owner) public view returns (uint256 balance) {
    return balances[_owner];
  }

}

// File: zeppelin-solidity/contracts/token/ERC20/ERC20.sol

/**
 * @title ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/20
 */
contract ERC20 is ERC20Basic {
  function allowance(address owner, address spender) public view returns (uint256);
  function transferFrom(address from, address to, uint256 value) public returns (bool);
  function approve(address spender, uint256 value) public returns (bool);
  event Approval(address indexed owner, address indexed spender, uint256 value);
}

// File: zeppelin-solidity/contracts/token/ERC20/StandardToken.sol

/**
 * @title Standard ERC20 token
 *
 * @dev Implementation of the basic standard token.
 * @dev https://github.com/ethereum/EIPs/issues/20
 * @dev Based on code by FirstBlood: https://github.com/Firstbloodio/token/blob/master/smart_contract/FirstBloodToken.sol
 */
contract StandardToken is ERC20, BasicToken {

  mapping (address => mapping (address => uint256)) internal allowed;


  /**
   * @dev Transfer tokens from one address to another
   * @param _from address The address which you want to send tokens from
   * @param _to address The address which you want to transfer to
   * @param _value uint256 the amount of tokens to be transferred
   */
  function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
    require(_to != address(0));
    require(_value <= balances[_from]);
    require(_value <= allowed[_from][msg.sender]);

    balances[_from] = balances[_from].sub(_value);
    balances[_to] = balances[_to].add(_value);
    allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
    Transfer(_from, _to, _value);
    return true;
  }

  /**
   * @dev Approve the passed address to spend the specified amount of tokens on behalf of msg.sender.
   *
   * Beware that changing an allowance with this method brings the risk that someone may use both the old
   * and the new allowance by unfortunate transaction ordering. One possible solution to mitigate this
   * race condition is to first reduce the spender's allowance to 0 and set the desired value afterwards:
   * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
   * @param _spender The address which will spend the funds.
   * @param _value The amount of tokens to be spent.
   */
  function approve(address _spender, uint256 _value) public returns (bool) {
    allowed[msg.sender][_spender] = _value;
    Approval(msg.sender, _spender, _value);
    return true;
  }

  /**
   * @dev Function to check the amount of tokens that an owner allowed to a spender.
   * @param _owner address The address which owns the funds.
   * @param _spender address The address which will spend the funds.
   * @return A uint256 specifying the amount of tokens still available for the spender.
   */
  function allowance(address _owner, address _spender) public view returns (uint256) {
    return allowed[_owner][_spender];
  }

  /**
   * @dev Increase the amount of tokens that an owner allowed to a spender.
   *
   * approve should be called when allowed[_spender] == 0. To increment
   * allowed value is better to use this function to avoid 2 calls (and wait until
   * the first transaction is mined)
   * From MonolithDAO Token.sol
   * @param _spender The address which will spend the funds.
   * @param _addedValue The amount of tokens to increase the allowance by.
   */
  function increaseApproval(address _spender, uint _addedValue) public returns (bool) {
    allowed[msg.sender][_spender] = allowed[msg.sender][_spender].add(_addedValue);
    Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
    return true;
  }

  /**
   * @dev Decrease the amount of tokens that an owner allowed to a spender.
   *
   * approve should be called when allowed[_spender] == 0. To decrement
   * allowed value is better to use this function to avoid 2 calls (and wait until
   * the first transaction is mined)
   * From MonolithDAO Token.sol
   * @param _spender The address which will spend the funds.
   * @param _subtractedValue The amount of tokens to decrease the allowance by.
   */
  function decreaseApproval(address _spender, uint _subtractedValue) public returns (bool) {
    uint oldValue = allowed[msg.sender][_spender];
    if (_subtractedValue > oldValue) {
      allowed[msg.sender][_spender] = 0;
    } else {
      allowed[msg.sender][_spender] = oldValue.sub(_subtractedValue);
    }
    Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
    return true;
  }

}

// File: zeppelin-solidity/contracts/token/ERC20/MintableToken.sol

/**
 * @title Mintable token
 * @dev Simple ERC20 Token example, with mintable token creation
 * @dev Issue: * https://github.com/OpenZeppelin/zeppelin-solidity/issues/120
 * Based on code by TokenMarketNet: https://github.com/TokenMarketNet/ico/blob/master/contracts/MintableToken.sol
 */
contract MintableToken is StandardToken, Ownable {
  event Mint(address indexed to, uint256 amount);
  event MintFinished();

  bool public mintingFinished = false;


  modifier canMint() {
    require(!mintingFinished);
    _;
  }

  /**
   * @dev Function to mint tokens
   * @param _to The address that will receive the minted tokens.
   * @param _amount The amount of tokens to mint.
   * @return A boolean that indicates if the operation was successful.
   */
  function mint(address _to, uint256 _amount) onlyOwner canMint public returns (bool) {
    totalSupply_ = totalSupply_.add(_amount);
    balances[_to] = balances[_to].add(_amount);
    Mint(_to, _amount);
    Transfer(address(0), _to, _amount);
    return true;
  }

  /**
   * @dev Function to stop minting new tokens.
   * @return True if the operation was successful.
   */
  function finishMinting() onlyOwner canMint public returns (bool) {
    mintingFinished = true;
    MintFinished();
    return true;
  }
}

// File: zeppelin-solidity/contracts/lifecycle/Pausable.sol

/**
 * @title Pausable
 * @dev Base contract which allows children to implement an emergency stop mechanism.
 */
contract Pausable is Ownable {
  event Pause();
  event Unpause();

  bool public paused = false;


  /**
   * @dev Modifier to make a function callable only when the contract is not paused.
   */
  modifier whenNotPaused() {
    require(!paused);
    _;
  }

  /**
   * @dev Modifier to make a function callable only when the contract is paused.
   */
  modifier whenPaused() {
    require(paused);
    _;
  }

  /**
   * @dev called by the owner to pause, triggers stopped state
   */
  function pause() onlyOwner whenNotPaused public {
    paused = true;
    Pause();
  }

  /**
   * @dev called by the owner to unpause, returns to normal state
   */
  function unpause() onlyOwner whenPaused public {
    paused = false;
    Unpause();
  }
}

// File: zeppelin-solidity/contracts/token/ERC20/PausableToken.sol

/**
 * @title Pausable token
 * @dev StandardToken modified with pausable transfers.
 **/
contract PausableToken is StandardToken, Pausable {

  function transfer(address _to, uint256 _value) public whenNotPaused returns (bool) {
    return super.transfer(_to, _value);
  }

  function transferFrom(address _from, address _to, uint256 _value) public whenNotPaused returns (bool) {
    return super.transferFrom(_from, _to, _value);
  }

  function approve(address _spender, uint256 _value) public whenNotPaused returns (bool) {
    return super.approve(_spender, _value);
  }

  function increaseApproval(address _spender, uint _addedValue) public whenNotPaused returns (bool success) {
    return super.increaseApproval(_spender, _addedValue);
  }

  function decreaseApproval(address _spender, uint _subtractedValue) public whenNotPaused returns (bool success) {
    return super.decreaseApproval(_spender, _subtractedValue);
  }
}

// File: contracts/LifToken.sol

/**
   @title L�f, the Winding Tree token

   Implementation of L�f, the ERC827 token for Winding Tree, an extension of the
   ERC20 token with extra methods to transfer value and data to execute a call
   on transfer.
   Uses OpenZeppelin StandardToken, ERC827Token, MintableToken and PausableToken.
 */
contract LifToken is StandardToken, MintableToken, PausableToken {
  // Token Name
  string public constant NAME = "L�f";

  // Token Symbol
  string public constant SYMBOL = "LIF";

  // Token decimals
  uint public constant DECIMALS = 18;

  /**
   * @dev Burns a specific amount of tokens.
   *
   * @param _value The amount of tokens to be burned.
   */
  function burn(uint256 _value) public whenNotPaused {

    require(_value <= balances[msg.sender]);

    balances[msg.sender] = balances[msg.sender].sub(_value);
    totalSupply_ = totalSupply_.sub(_value);

    // a Transfer event to 0x0 can be useful for observers to keep track of
    // all the Lif by just looking at those events
    Transfer(msg.sender, address(0), _value);
  }

  /**
   * @dev Burns a specific amount of tokens of an address
   * This function can be called only by the owner in the minting process
   *
   * @param _value The amount of tokens to be burned.
   */
  function burn(address burner, uint256 _value) public onlyOwner {

    require(!mintingFinished);

    require(_value <= balances[burner]);

    balances[burner] = balances[burner].sub(_value);
    totalSupply_ = totalSupply_.sub(_value);

    // a Transfer event to 0x0 can be useful for observers to keep track of
    // all the Lif by just looking at those events
    Transfer(burner, address(0), _value);
  }
}

// File: contracts/LifMarketValidationMechanism.sol

/**
   @title Market Validation Mechanism (MVM)
 */
contract LifMarketValidationMechanism is Ownable {
  using SafeMath for uint256;

  // The Lif token contract
  LifToken public lifToken;

  // The address of the foundation wallet. It can claim part of the eth funds
  // following an exponential curve until the end of the MVM lifetime (24 or 48
  // months). After that it can claim 100% of the remaining eth in the MVM.
  address public foundationAddr;

  // The amount of wei that the MVM received initially
  uint256 public initialWei;

  // Start timestamp since which the MVM begins to accept tokens via sendTokens
  uint256 public startTimestamp;

  // Quantity of seconds in every period, usually equivalent to 30 days
  uint256 public secondsPerPeriod;

  // Number of periods. It should be 24 or 48 (each period is roughly a month)
  uint8 public totalPeriods;

  // The total amount of wei that was claimed by the foundation so far
  uint256 public totalWeiClaimed = 0;

  // The price at which the MVM buys tokens at the beginning of its lifetime
  uint256 public initialBuyPrice = 0;

  // Amount of tokens that were burned by the MVM
  uint256 public totalBurnedTokens = 0;

  // Amount of wei that was reimbursed via sendTokens calls
  uint256 public totalReimbursedWei = 0;

  // Total supply of tokens when the MVM was created
  uint256 public originalTotalSupply;

  uint256 constant PRICE_FACTOR = 100000;

  // Has the MVM been funded by calling `fund`? It can be funded only once
  bool public funded = false;

  // true when the market MVM is paused
  bool public paused = false;

  // total amount of seconds that the MVM was paused
  uint256 public totalPausedSeconds = 0;

  // the timestamp where the MVM was paused
  uint256 public pausedTimestamp;

  uint256[] public periods;

  // Events
  event Pause();
  event Unpause(uint256 pausedSeconds);

  event ClaimedWei(uint256 claimedWei);
  event SentTokens(address indexed sender, uint256 price, uint256 tokens, uint256 returnedWei);

  modifier whenNotPaused(){
    assert(!paused);
    _;
  }

  modifier whenPaused(){
    assert(paused);
    _;
  }

  /**
     @dev Constructor

     @param lifAddr the lif token address
     @param _startTimestamp see `startTimestamp`
     @param _secondsPerPeriod see `secondsPerPeriod`
     @param _totalPeriods see `totalPeriods`
     @param _foundationAddr see `foundationAddr`
    */
  function LifMarketValidationMechanism(
    address lifAddr, uint256 _startTimestamp, uint256 _secondsPerPeriod,
    uint8 _totalPeriods, address _foundationAddr
  ) {
    require(lifAddr != address(0));
    require(_startTimestamp > block.timestamp);
    require(_secondsPerPeriod > 0);
    require(_totalPeriods == 24 || _totalPeriods == 48);
    require(_foundationAddr != address(0));

    lifToken = LifToken(lifAddr);
    startTimestamp = _startTimestamp;
    secondsPerPeriod = _secondsPerPeriod;
    totalPeriods = _totalPeriods;
    foundationAddr = _foundationAddr;

  }

  /**
     @dev Receives the initial funding from the Crowdsale. Calculates the
     initial buy price as initialWei / totalSupply
    */
  function fund() public payable onlyOwner {
    assert(!funded);

    originalTotalSupply = lifToken.totalSupply();
    initialWei = msg.value;
    initialBuyPrice = initialWei.
      mul(PRICE_FACTOR).
      div(originalTotalSupply);

    funded = true;
  }

  /**
     @dev Change the LifToken address
    */
  function changeToken(address newToken) public onlyOwner {
    lifToken = LifToken(newToken);
  }

  /**
     @dev calculates the exponential distribution curve. It determines how much
     wei can be distributed back to the foundation every month. It starts with
     very low amounts ending with higher chunks at the end of the MVM lifetime
    */
  function calculateDistributionPeriods() public {
    assert(totalPeriods == 24 || totalPeriods == 48);
    assert(periods.length == 0);

    // Table with the max delta % that can be distributed back to the foundation on
    // each period. It follows an exponential curve (starts with lower % and ends
    // with higher %) to keep the funds in the MVM longer. deltas24
    // is used when MVM lifetime is 24 months, deltas48 when it's 48 months.
    // The sum is less than 100% because the last % is missing: after the last period
    // the 100% remaining can be claimed by the foundation. Values multipled by 10^5

    uint256[24] memory accumDistribution24 = [
      uint256(0), 18, 117, 351, 767, 1407,
      2309, 3511, 5047, 6952, 9257, 11995,
      15196, 18889, 23104, 27870, 33215, 39166,
      45749, 52992, 60921, 69561, 78938, 89076
    ];

    uint256[48] memory accumDistribution48 = [
      uint256(0), 3, 18, 54, 117, 214, 351, 534,
      767, 1056, 1406, 1822, 2308, 2869, 3510, 4234,
      5046, 5950, 6950, 8051, 9256, 10569, 11994, 13535,
      15195, 16978, 18888, 20929, 23104, 25416, 27870, 30468,
      33214, 36112, 39165, 42376, 45749, 49286, 52992, 56869,
      60921, 65150, 69560, 74155, 78937, 83909, 89075, 94438
    ];

    for (uint8 i = 0; i < totalPeriods; i++) {

      if (totalPeriods == 24) {
        periods.push(accumDistribution24[i]);
      } else {
        periods.push(accumDistribution48[i]);
      }

    }
  }

  /**
     @dev Returns the current period as a number from 0 to totalPeriods

     @return the current period as a number from 0 to totalPeriods
    */
  function getCurrentPeriodIndex() public view returns(uint256) {
    assert(block.timestamp >= startTimestamp);
    return block.timestamp.sub(startTimestamp).
      sub(totalPausedSeconds).
      div(secondsPerPeriod);
  }

  /**
     @dev calculates the accumulated distribution percentage as of now,
     following the exponential distribution curve

     @return the accumulated distribution percentage, used to calculate things
     like the maximum amount that can be claimed by the foundation
    */
  function getAccumulatedDistributionPercentage() public view returns(uint256 percentage) {
    uint256 period = getCurrentPeriodIndex();

    assert(period < totalPeriods);

    return periods[period];
  }

  /**
     @dev returns the current buy price at which the MVM offers to buy tokens to
     burn them

     @return the current buy price (in eth/lif, multiplied by PRICE_FACTOR)
    */
  function getBuyPrice() public view returns (uint256 price) {
    uint256 accumulatedDistributionPercentage = getAccumulatedDistributionPercentage();

    return initialBuyPrice.
      mul(PRICE_FACTOR.sub(accumulatedDistributionPercentage)).
      div(PRICE_FACTOR);
  }

  /**
     @dev Returns the maximum amount of wei that the foundation can claim. It's
     a portion of the ETH that was not claimed by token holders

     @return the maximum wei claimable by the foundation as of now
    */
  function getMaxClaimableWeiAmount() public view returns (uint256) {
    if (isFinished()) {
      return this.balance;
    } else {
      uint256 claimableFromReimbursed = initialBuyPrice.
        mul(totalBurnedTokens).div(PRICE_FACTOR).
        sub(totalReimbursedWei);
      uint256 currentCirculation = lifToken.totalSupply();
      uint256 accumulatedDistributionPercentage = getAccumulatedDistributionPercentage();
      uint256 maxClaimable = initialWei.
        mul(accumulatedDistributionPercentage).div(PRICE_FACTOR).
        mul(currentCirculation).div(originalTotalSupply).
        add(claimableFromReimbursed);

      if (maxClaimable > totalWeiClaimed) {
        return maxClaimable.sub(totalWeiClaimed);
      } else {
        return 0;
      }
    }
  }

  /**
     @dev allows to send tokens to the MVM in exchange of Eth at the price
     determined by getBuyPrice. The tokens are burned
    */
  function sendTokens(uint256 tokens) public whenNotPaused {
    require(tokens > 0);

    uint256 price = getBuyPrice();
    uint256 totalWei = tokens.mul(price).div(PRICE_FACTOR);

    lifToken.transferFrom(msg.sender, address(this), tokens);
    lifToken.burn(tokens);
    totalBurnedTokens = totalBurnedTokens.add(tokens);

    SentTokens(msg.sender, price, tokens, totalWei);

    totalReimbursedWei = totalReimbursedWei.add(totalWei);
    msg.sender.transfer(totalWei);
  }

  /**
     @dev Returns whether the MVM end-of-life has been reached. When that
     happens no more tokens can be sent to the MVM and the foundation can claim
     100% of the remaining balance in the MVM

     @return true if the MVM end-of-life has been reached
    */
  function isFinished() public view returns (bool finished) {
    return getCurrentPeriodIndex() >= totalPeriods;
  }

  /**
     @dev Called from the foundation wallet to claim eth back from the MVM.
     Maximum amount that can be claimed is determined by
     getMaxClaimableWeiAmount
    */
  function claimWei(uint256 weiAmount) public whenNotPaused {
    require(msg.sender == foundationAddr);

    uint256 claimable = getMaxClaimableWeiAmount();

    assert(claimable >= weiAmount);

    foundationAddr.transfer(weiAmount);

    totalWeiClaimed = totalWeiClaimed.add(weiAmount);

    ClaimedWei(weiAmount);
  }

  /**
     @dev Pauses the MVM. No tokens can be sent to the MVM and no eth can be
     claimed from the MVM while paused. MVM total lifetime is extended by the
     period it stays paused
    */
  function pause() public onlyOwner whenNotPaused {
    paused = true;
    pausedTimestamp = block.timestamp;

    Pause();
  }

  /**
     @dev Unpauses the MVM. See `pause` for more details about pausing
    */
  function unpause() public onlyOwner whenPaused {
    uint256 pausedSeconds = block.timestamp.sub(pausedTimestamp);
    totalPausedSeconds = totalPausedSeconds.add(pausedSeconds);
    paused = false;

    Unpause(pausedSeconds);
  }

}

// File: contracts/VestedPayment.sol

/**
   @title Vested Payment Schedule for LifToken

   An ownable vesting schedule for the LifToken, the tokens can only be
   claimed by the owner. The contract has a start timestamp, a duration
   of each period in seconds (it can be days, months, years), a total
   amount of periods and a cliff. The available amount of tokens will
   be calculated based on the balance of LifTokens of the contract at
   that time.
 */

contract VestedPayment is Ownable {
  using SafeMath for uint256;

  // When the vested schedule starts
  uint256 public startTimestamp;

  // How many seconds each period will last
  uint256 public secondsPerPeriod;

  // How many periods will have in total
  uint256 public totalPeriods;

  // The amount of tokens to be vested in total
  uint256 public tokens;

  // How many tokens were claimed
  uint256 public claimed;

  // The token contract
  LifToken public token;

  // Duration (in periods) of the initial cliff in the vesting schedule
  uint256 public cliffDuration;

  /**
     @dev Constructor.

     @param _startTimestamp see `startTimestamp`
     @param _secondsPerPeriod see `secondsPerPeriod`
     @param _totalPeriods see `totalPeriods
     @param _cliffDuration see `cliffDuration`
     @param _tokens see `tokens`
     @param tokenAddress the address of the token contract
   */
  function VestedPayment(
    uint256 _startTimestamp, uint256 _secondsPerPeriod,
    uint256 _totalPeriods, uint256 _cliffDuration,
    uint256 _tokens, address tokenAddress
  ) {
    require(_startTimestamp >= block.timestamp);
    require(_secondsPerPeriod > 0);
    require(_totalPeriods > 0);
    require(tokenAddress != address(0));
    require(_cliffDuration < _totalPeriods);
    require(_tokens > 0);

    startTimestamp = _startTimestamp;
    secondsPerPeriod = _secondsPerPeriod;
    totalPeriods = _totalPeriods;
    cliffDuration = _cliffDuration;
    tokens = _tokens;
    token = LifToken(tokenAddress);
  }

  /**
     @dev Change the LifToken address
    */
  function changeToken(address newToken) public onlyOwner {
    token = LifToken(newToken);
  }

  /**
     @dev Get how many tokens are available to be claimed
   */
  function getAvailableTokens() public view returns (uint256) {
    uint256 period = block.timestamp.sub(startTimestamp)
      .div(secondsPerPeriod);

    if (period < cliffDuration) {
      return 0;
    } else if (period >= totalPeriods) {
      return tokens.sub(claimed);
    } else {
      return tokens.mul(period.add(1)).div(totalPeriods).sub(claimed);
    }
  }

  /**
     @dev Claim the tokens, they can be claimed only by the owner
     of the contract

     @param amount how many tokens to be claimed
   */
  function claimTokens(uint256 amount) public onlyOwner {
    assert(getAvailableTokens() >= amount);

    claimed = claimed.add(amount);
    token.transfer(owner, amount);
  }

}