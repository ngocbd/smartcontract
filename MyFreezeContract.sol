/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract MyFreezeContract at 0xcc669f2e37606e38db0a73b6fe79329b99d37db6
*/
pragma solidity ^0.4.21;


/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {

  /**
  * @dev Multiplies two numbers, throws on overflow.
  */
  function mul(uint256 a, uint256 b) internal pure returns (uint256 c) {
    // Gas optimization: this is cheaper than asserting 'a' not being zero, but the
    // benefit is lost if 'b' is also tested.
    // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
    if (a == 0) {
      return 0;
    }

    c = a * b;
    assert(c / a == b);
    return c;
  }

  /**
  * @dev Integer division of two numbers, truncating the quotient.
  */
  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    // uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return a / b;
  }

  /**
  * @dev Subtracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
  */
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  /**
  * @dev Adds two numbers, throws on overflow.
  */
  function add(uint256 a, uint256 b) internal pure returns (uint256 c) {
    c = a + b;
    assert(c >= a);
    return c;
  }
}


/**
 * Utility library of inline functions on addresses
 */
library AddressUtils {

  /**
   * Returns whether the target address is a contract
   * @dev This function will return false if invoked during the constructor of a contract,
   * as the code is not actually created until after the constructor finishes.
   * @param addr address to check
   * @return whether the target address is a contract
   */
  function isContract(address addr) internal view returns (bool) {
    uint256 size;
    // XXX Currently there is no better way to check if there is a contract in an address
    // than to check the size of the code at that address.
    // See https://ethereum.stackexchange.com/a/14016/36603
    // for more details about how this works.
    // TODO Check this again before the Serenity release, because all addresses will be
    // contracts then.
    // solium-disable-next-line security/no-inline-assembly
    assembly { size := extcodesize(addr) }
    return size > 0;
  }
}


/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
  address public owner;


  event OwnershipRenounced(address indexed previousOwner);
  event OwnershipTransferred(
    address indexed previousOwner,
    address indexed newOwner
  );


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
   * @dev Allows the current owner to relinquish control of the contract.
   * @notice Renouncing to ownership will leave the contract without an owner.
   * It will not be possible to call the functions with the `onlyOwner`
   * modifier anymore.
   */
  function renounceOwnership() public onlyOwner {
    emit OwnershipRenounced(owner);
    owner = address(0);
  }

  /**
   * @dev Allows the current owner to transfer control of the contract to a newOwner.
   * @param _newOwner The address to transfer ownership to.
   */
  function transferOwnership(address _newOwner) public onlyOwner {
    _transferOwnership(_newOwner);
  }

  /**
   * @dev Transfers control of the contract to a newOwner.
   * @param _newOwner The address to transfer ownership to.
   */
  function _transferOwnership(address _newOwner) internal {
    require(_newOwner != address(0));
    emit OwnershipTransferred(owner, _newOwner);
    owner = _newOwner;
  }
}


/**
 * @title ERC20Basic
 * @dev Simpler version of ERC20 interface
 * See https://github.com/ethereum/EIPs/issues/179
 */
contract ERC20Basic {
  function totalSupply() public view returns (uint256);
  function balanceOf(address who) public view returns (uint256);
  function transfer(address to, uint256 value) public returns (bool);
  event Transfer(address indexed from, address indexed to, uint256 value);
}


/**
 * @title ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/20
 */
contract ERC20 is ERC20Basic {

  function allowance(address owner, address spender) public view returns (uint256);

  function transferFrom(address from, address to, uint256 value) public returns (bool);

  function approve(address spender, uint256 value) public returns (bool);

  event Approval(address indexed owner,address indexed spender,uint256 value);
}

library SafeERC20 {
  function safeTransfer(ERC20Basic token, address to, uint256 value) internal {
    require(token.transfer(to, value));
  }

  function safeTransferFrom(ERC20 token,address from,address to,uint256 value) internal{
    require(token.transferFrom(from, to, value));
  }

  function safeApprove(ERC20 token, address spender, uint256 value) internal {
    require(token.approve(spender, value));
  }
}


//?????
contract FreezeAdmin is Ownable{
  address public freezeAdmin;
  function FreezeAdmin() public{
    freezeAdmin = msg.sender;
  }
  function setFreezeAdmin(address _freezeAdmin) onlyOwner public {
    freezeAdmin = _freezeAdmin;
  }

  modifier onlyFreezeAdmin() {
    require(msg.sender == freezeAdmin);
    _;
  }
}


//????
contract MyFreezeContract is Ownable,FreezeAdmin{
  
  using SafeMath for uint256;
  
  using SafeERC20 for ERC20;
    
  ERC20 public token;
  
  uint256 public totalAllowedFreeze;
  
  uint256 public totalFreezed = 0;//????? 
  
  address[]  public freezedWallets;//????????    
    
  struct FreezeData{
    uint256 balance;//??
    uint256 amount;//????
    uint256 unFreezeCount;//????? 
  }
  mapping (address => FreezeData) public freezeDatas;
  
 
  struct UnFreezeRule{
    uint256 unfreezetime; //????
    uint256 percentage;//????
  } 

  UnFreezeRule[] public unFreezeRules;//????--?????????
  
  event Freeze(address indexed from, uint256 value);  
  event Unfreeze(address indexed from, uint256 value);
    
  function MyFreezeContract(address _token) public {
      
    token = ERC20(_token);
      
    totalAllowedFreeze = token.totalSupply().mul(20).div(100);//????????,????20%
      
    uint256 freezeAt = block.timestamp;//????????
	
    //uint256 duration = 1*1 days; //???????????	    
    uint256 duration = 60; //???????????(??-?)
		
    uint256 unfreezeAt1 = freezeAt + duration;
	
    uint256 unfreezeAt2 = unfreezeAt1 + duration;
	
    uint256 unfreezeAt3 = unfreezeAt2 + duration;
    
	
    unFreezeRules.push(UnFreezeRule({unfreezetime:unfreezeAt1,percentage:50}));//????1???50%
	
    unFreezeRules.push(UnFreezeRule({unfreezetime:unfreezeAt2,percentage:30}));//????2???30%
	
    unFreezeRules.push(UnFreezeRule({unfreezetime:unfreezeAt3,percentage:20}));//????3???20%
  }
  
  //??
  function freeze(address _investor,uint256 _value) onlyFreezeAdmin public returns (bool) {
  
    require(_investor != 0x0 && !AddressUtils.isContract(_investor));
	
    require(_value > 0 );
	
    require(totalAllowedFreeze >= totalFreezed.add(_value));//??????????
	
    FreezeData storage freezeData =  freezeDatas[_investor];
	
    require(freezeData.amount == 0);//????????????????
	
    freezeData.balance = freezeData.balance.add(_value); 
	
    freezeData.amount = freezeData.amount.add(_value);  
	
    totalFreezed = totalFreezed.add(_value);  
	
    freezedWallets.push(_investor);//?????????    
	
    emit Freeze(_investor,_value);
    
    return true;
  }
  
  //??????????????????????
  function unFreeze(address _investor) onlyFreezeAdmin public returns(bool){
      
    require(freezeDatas[_investor].balance > 0);
    
    require(freezeDatas[_investor].unFreezeCount < unFreezeRules.length);
    
    uint256 unfreezetime = unFreezeRules[freezeDatas[_investor].unFreezeCount].unfreezetime;
    
    uint256 percentage =  unFreezeRules[freezeDatas[_investor].unFreezeCount].percentage;
    
    require(block.timestamp >= unfreezetime);
    
    uint256  currentUnFreezeAmount = freezeDatas[_investor].amount.mul(percentage).div(100);
    
    require(token.balanceOf(address(this)) >= currentUnFreezeAmount);
    
    freezeDatas[_investor].balance = freezeDatas[_investor].balance.sub(currentUnFreezeAmount);
    
    freezeDatas[_investor].unFreezeCount = freezeDatas[_investor].unFreezeCount.add(1);
    
    token.safeTransfer(_investor,currentUnFreezeAmount);
    
    emit Unfreeze(_investor,currentUnFreezeAmount);    
    
    return true;
  }

}