/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract MyPurchaseContract at 0x29551f9118ec3b29a3592e2b53285be51e3d21fd
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


contract PurchaseAdmin is Ownable{
    
  address public purchaseAdmin;
  
  bool public purchaseEnable = true;
  
  bool public grantEnable = true;
  
  //??????
  uint256 public startAt;

  //??????
  uint256 public stopAt;

  //????
  uint256 public grantAt;
  
  event PurchaseEnable(address indexed from, bool enable);
  
  event GrantEnable(address indexed from, bool enable);

  function PurchaseAdmin() public{
    purchaseAdmin = msg.sender;
  }

  function setPurchaseAdmin(address _purchaseAdmin) onlyOwner public {
    purchaseAdmin = _purchaseAdmin;
  }

  modifier onlyPurchaseAdmin() {
    require(msg.sender == purchaseAdmin);
    _;
  }
  
  function setEnablePurchase(bool enable ) onlyPurchaseAdmin public {
    purchaseEnable = enable;
    emit PurchaseEnable(msg.sender,enable);
  }
  
  modifier checkPurchaseEnable() {
    require(purchaseEnable);
     require(block.timestamp >= startAt && block.timestamp <= stopAt);//???????
    _;
  }

  function setGrantEnable(bool enable ) onlyOwner public {
    grantEnable = enable;
    emit GrantEnable(msg.sender,enable);
  }

   modifier checkGrantEnable() {
    require(grantEnable);
    require(block.timestamp >= grantAt);
    _;
  }
}


//????
contract MyPurchaseContract is Ownable,PurchaseAdmin{

  using SafeMath for uint256;

  using SafeERC20 for ERC20;

  ERC20 public token;

  //?????
  uint256 public totalAllocatedPurchase;

  //???????
  uint256 public remainingPurchaseAmount;

  //?????????????1ether = 500UHT 
  uint256 public buyPrice =  (10 ** uint256(18)) / (500* (10 ** uint256(6)));
  
  //???????????????????????100000?UHT
  uint256 public maxPurchase = 100000;

  //????????????5000?UHT
  uint256 public maxPurchaseOnce = 50000;

  //????????????100?UHT
  uint256 public minPurchaseOnce = 1000;

  //????
  uint256 grantCount = 0;

  struct PurchaseData{
    //?????
    uint256 amount;
    
    //?????
    bool grantDone;
  }

  //????
  mapping (address => PurchaseData) public purchasedDatas;

  //?????????
  address[]  public purchasedWallets;

  event Purchase(address indexed from, uint256 value);

  event Grant(address indexed to, uint256 value);

  function MyPurchaseContract(address _token) public {
    token = ERC20(_token);
    totalAllocatedPurchase = token.totalSupply().mul(30).div(100);//????????30%;
    remainingPurchaseAmount = totalAllocatedPurchase;
    startAt = block.timestamp;//??????
    stopAt = block.timestamp + 60;//??????
    grantAt = block.timestamp + 120;//????
  }

  //??  
  function buyTokens()  payable checkPurchaseEnable public returns(uint256){
      
    require(msg.value > 0);

    require(remainingPurchaseAmount > 0);//?????????

    require(purchasedDatas[msg.sender].amount < maxPurchase);//?????????????????
    
    uint256 hopeAmount = msg.value.div(buyPrice);//???????????

    //???????????minPurchaseOnce???
    if (purchasedDatas[msg.sender].amount == 0 && hopeAmount < minPurchaseOnce) {
      msg.sender.transfer(msg.value);//???????????
      return 0;
    }

    uint256 currentAmount = hopeAmount;

    //????????????
    if (hopeAmount >= maxPurchaseOnce) {
       currentAmount = maxPurchaseOnce;
    } 

    //???????????
    if (currentAmount >= remainingPurchaseAmount) {
       currentAmount = remainingPurchaseAmount;
    } 

    //???????????
    if (purchasedDatas[msg.sender].amount == 0){
       purchasedWallets.push(msg.sender);
    }

    purchasedDatas[msg.sender].amount = purchasedDatas[msg.sender].amount.add(currentAmount);
    
    remainingPurchaseAmount = remainingPurchaseAmount.sub(currentAmount);
    
    emit Purchase(msg.sender,currentAmount);  

    if (hopeAmount > currentAmount){
      //???????ether?????
      uint256 out = hopeAmount.sub(currentAmount);
      //???????ether
      uint256 retwei = out.mul(buyPrice);
      //??ether
      msg.sender.transfer(retwei);
    }

    return currentAmount;
  }


  //??
  function grantTokens(address _purchaser) onlyPurchaseAdmin checkGrantEnable public returns(bool){
      
    require(_purchaser  != address(0));
    
    require(purchasedDatas[_purchaser].grantDone);
    
    uint256 amount = purchasedDatas[_purchaser].amount;
    
    token.safeTransfer(_purchaser,amount);
    
    purchasedDatas[_purchaser].grantDone = true;
    
    grantCount = grantCount.add(1);

    emit Grant(_purchaser,amount);
    
    return true;
  }


  function claimETH() onlyPurchaseAdmin public returns(bool){

    require(block.timestamp > grantAt);

    require(grantCount == purchasedWallets.length);
    
    msg.sender.transfer(address(this).balance);
    
    return true;
  }
}