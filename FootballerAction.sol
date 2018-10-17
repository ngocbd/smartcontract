/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract FootballerAction at 0xf213d198b68b10654c63a9ed05a045e1d4a50f9f
*/
pragma solidity ^0.4.17;

/// @title Interface for contracts conforming to ERC-721: Non-Fungible Tokens
/// @author Dieter Shirley <dete@axiomzen.co> (https://github.com/dete)
contract ERC721 {
    // Required methods
    function implementsERC721() public pure returns (bool);
    function totalSupply() public view returns (uint256 total);
    function balanceOf(address _owner) public view returns (uint256 balance);
    function ownerOf(uint256 _tokenId) external view returns (address owner);
    function approve(address _to, uint256 _tokenId) external;
    function transfer(address _to, uint256 _tokenId) public;
    function transferFrom(address _from, address _to, uint256 _tokenId) external;

    // Events
    event Transfer(address from, address to, uint256 tokenId);
    event Approval(address owner, address approved, uint256 tokenId);
    // Optional
    // function name() public view returns (string name);
    // function symbol() public view returns (string symbol);
    // function tokensOfOwner(address _owner) external view returns (uint256[] tokenIds);
    // function tokenMetadata(uint256 _tokenId, string _preferredTransport) public view returns (string infoUrl);

    // ERC-165 Compatibility (https://github.com/ethereum/EIPs/issues/165)
    // function supportsInterface(bytes4 _interfaceID) external view returns (bool);
}

contract FootballerAccessControl{

  ///@dev Emited when contract is upgraded
  event ContractUpgrade(address newContract);
  //The address of manager (the account or contracts) that can execute action within the role.
  address public managerAddress;

  ///@dev keeps track whether the contract is paused.
  bool public paused = false;

  function FootballerAccessControl() public {
    managerAddress = msg.sender;
  }

  /// @dev Access modifier for manager-only functionality
  modifier onlyManager() {
    require(msg.sender == managerAddress);
    _;
  }

  ///@dev assigns a new address to act as the Manager.Only available to the current Manager.
  function setManager(address _newManager) external onlyManager {
    require(_newManager != address(0));
    managerAddress = _newManager;
  }

  /*** Pausable functionality adapted from OpenZeppelin ***/

  /// @dev Modifier to allow actions only when the contract IS NOT paused
  modifier whenNotPaused() {
    require(!paused);
    _;
  }

  /// @dev Modifier to allow actions only when the contract IS paused
  modifier whenPaused {
      require(paused);
      _;
  }

  /// @dev Called by manager to pause the contract. Used only when
  ///  a bug or exploit is detected and we need to limit damage.
  function pause() external onlyManager whenNotPaused {
    paused = true;
  }

  /// @dev Unpauses the smart contract. Can only be called by the manager,
  /// since one reason we may pause the contract is when manager accounts are compromised.
  /// @notice This is public rather than external so it can be called by derived contracts.
  function unpause() public onlyManager {
    // can't unpause if contract was upgraded
    paused = false;
  }

}

contract FootballerBase is FootballerAccessControl {
  using SafeMath for uint256;
  /*** events ***/
  event Create(address owner, uint footballerId);
  event Transfer(address _from, address _to, uint256 tokenId);

  uint private randNonce = 0;

  //??/?? ??
  struct footballer {
    uint price; //??-?? ? ??-??? ??wei
    //???????
    uint defend; //??
    uint attack; //??
    uint quality; //??
  }

  //??????
  footballer[] public footballers;
  //????id???????????
  mapping (uint256 => address) public footballerToOwner;

  //????????????balanceOf??????????????
  mapping (address => uint256) public ownershipTokenCount;

  //?footballID ? ?????transferFrom????????
  //???????????????????????
  mapping (uint256 => address) public footballerToApproved;

  // ????????? ?? ????
  function _transfer(address _from, address _to, uint256 _tokenId) internal {
    footballerToApproved[_tokenId] = address(0);
    ownershipTokenCount[_to] = ownershipTokenCount[_to].add(1);
    footballerToOwner[_tokenId] = _to;
    ownershipTokenCount[_from] = ownershipTokenCount[_from].sub(1);
    emit Transfer(_from, _to, _tokenId);
  }

  //?????????,?createStar????????????????????
  function _createFootballerStar(uint _price,uint _defend,uint _attack, uint _quality) internal onlyManager returns(uint) {
      footballer memory _player = footballer({
        price:_price,
        defend:_defend,
        attack:_attack,
        quality:_quality
      });
      uint newFootballerId = footballers.push(_player) - 1;
      footballerToOwner[newFootballerId] = managerAddress;
      ownershipTokenCount[managerAddress] = ownershipTokenCount[managerAddress].add(1);
      //????????????
      footballerToApproved[newFootballerId] = managerAddress;
      require(newFootballerId == uint256(uint32(newFootballerId)));
      emit Create(managerAddress, newFootballerId);
      return newFootballerId;
    }


    //????????????????
    function createFootballer () internal returns (uint) {
        footballer memory _player = footballer({
          price: 0,
          defend: _randMod(20,80),
          attack: _randMod(20,80),
          quality: _randMod(20,80)
        });
        uint newFootballerId = footballers.push(_player) - 1;
      //  require(newFootballerId == uint256(uint32(newFootballerId)));
        footballerToOwner[newFootballerId] = msg.sender;
        ownershipTokenCount[msg.sender] =ownershipTokenCount[msg.sender].add(1);
        emit Create(msg.sender, newFootballerId);
        return newFootballerId;
    }

  // ????? _min ? _max ??????????? _max?
  function _randMod(uint _min, uint _max) private returns(uint) {
      randNonce++;
      uint modulus = _max - _min;
      return uint(keccak256(now, msg.sender, randNonce)) % modulus + _min;
  }

}

contract FootballerOwnership is FootballerBase, ERC721 {
  /// @notice Name and symbol of the non fungible token, as defined in ERC721.
  string public constant name = "CyptoWorldCup";
  string public constant symbol = "CWC";


  function implementsERC721() public pure returns (bool) {
    return true;
  }

  //??????????????????????
  function _owns(address _claimant, uint256 _tokenId) internal view returns (bool) {
    return footballerToOwner[_tokenId] == _claimant;
  }

  //????????????????? ???? transferApproval
  function _approvedFor(address _claimant, uint256 _tokenId) internal view returns (bool) {
    return footballerToApproved[_tokenId] == _claimant;
  }

  //??????? ? ???transfer???
  function _approve(uint256 _tokenId, address _approved) internal {
      footballerToApproved[_tokenId] = _approved;
  }

  //?? owner ??????
  function balanceOf(address _owner) public view returns (uint256 count) {
    return ownershipTokenCount[_owner];
  }

  //?? ?? ? ?????
  function transfer(address _to, uint256 _tokenId) public whenNotPaused {
    require(_to != address(0));
    require(_to != address(this));
    //??send?????
    require(_owns(msg.sender, _tokenId));
    //????????????? approvals ???????
    _transfer(msg.sender, _to, _tokenId);
  }

  //?????????transferFrom????????????
  function approve(address _to, uint256 _tokenId) external whenNotPaused {
    //??????????????????????
    require(_owns(msg.sender, _tokenId));
    _approve(_tokenId, _to);
    emit Approval(msg.sender, _to, _tokenId);
  }

  //????????????????????????????????
  function transferFrom(address _from, address _to, uint256 _tokenId) external whenNotPaused {
    require(_to != address(0));
    //????????????????
    // ?????????????? ?????????????? ?????
    require(_to != address(this));
    require(_approvedFor(msg.sender, _tokenId));
    require(_owns(_from, _tokenId));
    //??????FootballerBase
    _transfer(_from, _to, _tokenId);
  }

  //????????????+???
  function totalSupply() public view returns (uint) {
    return footballers.length;
  }

  //??????????????
  function ownerOf(uint256 _tokenId) external view returns (address owner) {
    owner = footballerToOwner[_tokenId];
    require(owner != address(0));
  }

  //??????????????id
  function tokensOfOwner(address _owner) external view returns(uint256[] ownerTokens) {
    uint256 tokenCount = balanceOf(_owner);
    if(tokenCount == 0) {
      return new uint256[](0);
    } else {
      uint256[] memory result = new uint256[](tokenCount);
      uint256 totalpalyers = totalSupply();
      uint256 resultIndex = 0;
      uint256 footballerId;
      for (footballerId = 0; footballerId < totalpalyers; footballerId++) {
        if(footballerToOwner[footballerId] == _owner) {
          result[resultIndex] = footballerId;
          resultIndex++;
        }
      }
      return result;
    }
  }
}

contract FootballerAction is FootballerOwnership {
  //????
  function createFootballerStar(uint _price,uint _defend,uint _attack, uint _quality) public returns(uint) {
      return _createFootballerStar(_price,_defend,_attack,_quality);
  }

  //??????
  function CardFootballers() public payable returns (uint) {
      uint price = 4000000000000 wei; //0.04 eth
      require(msg.value >= price);
      uint ballerCount = 14;
      uint newFootballerId = 0;
      for (uint i = 0; i < ballerCount; i++) {
         newFootballerId = createFootballer();
      }
      managerAddress.transfer(msg.value);
      return price;
  }

  function buyStar(uint footballerId,uint price) public payable  {
    require(msg.value >= price);
    //??????? ?? ?????
    address holder = footballerToApproved[footballerId];
    require(holder != address(0));
    _transfer(holder,msg.sender,footballerId);
    //?????
    holder.transfer(msg.value);
  }

  //??????????????
  function sell(uint footballerId,uint price) public returns(uint) {
    require(footballerToOwner[footballerId] == msg.sender);
    require(footballerToApproved[footballerId] == address(0));
    footballerToApproved[footballerId] = msg.sender;
    footballers[footballerId].price = price;
  }

  //????
  function getTeamBallers(address actor) public view returns (uint[]) {
    uint len = footballers.length;
    uint count=0;
    for(uint i = 0; i < len; i++) {
        if(_owns(actor, i)){
          if(footballerToApproved[i] == address(0)){
            count++;
          }
       }
    }
    uint[] memory res = new uint256[](count);
    uint index = 0;
    for(i = 0; i < len; i++) {
      if(_owns(actor, i)){
          if(footballerToApproved[i] == address(0)){
            res[index] = i;
            index++;
          }
        }
    }
    return res;
  }

  //???????+??
  function getSellBallers() public view returns (uint[]) {
    uint len = footballers.length;
    uint count = 0;
    for(uint i = 0; i < len; i++) {
        if(footballerToApproved[i] != address(0)){
          count++;
        }
    }
    uint[] memory res = new uint256[](count);
    uint index = 0;
    for( i = 0; i < len; i++) {
        if(footballerToApproved[i] != address(0)){
          res[index] = i;
          index++;
        }
    }
    return res;
  }

  //????+??????
  function getAllBaller() public view returns (uint) {
    uint len = totalSupply();
    return len;
  }

}

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