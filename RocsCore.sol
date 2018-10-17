/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract RocsCore at 0x37b99aabab9e6d8fd70b4255623b2aa7eb92ec12
*/
pragma solidity ^0.4.22;

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
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }

}

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
    *               ???????????????????????????
    */
    modifier whenNotPaused() {
        require(!paused);
        _;
    }

    /**
    * @dev Modifier to make a function callable only when the contract is paused.
    *               ????????????????????????????
    */
    modifier whenPaused() {
        require(paused);
        _;
    }

    /**
    * @dev called by the owner to pause, triggers stopped state
    *             ????????????????????????????????
    */
    function pause() onlyOwner whenNotPaused public {
        paused = true;
        emit Pause();
    }

    /**
    * @dev called by the owner to unpause, returns to normal state
    *             ?????????????????????????????
    */
    function unpause() onlyOwner whenPaused public {
        paused = false;
        emit Unpause();
    }
}

contract RocsBase is Pausable {

    // ???
    uint128 public eggPrice = 50 finney;
    function setEggPrice(uint128 _price) public onlyOwner {
        eggPrice = _price;
    }
    // ???
    uint128 public evolvePrice = 5 finney;
    function setEvolvePrice(uint128 _price) public onlyOwner {
        evolvePrice = _price;
    }

    // ??
    event RocCreated(address owner, uint tokenId, uint rocId);
    // ERC721
    event Transfer(address from, address to, uint tokenId);
    event ItemTransfer(address from, address to, uint tokenId);

    /// @dev Roc????
    struct Roc {
        // ID
        uint rocId;
        // DNA
        string dna;
        // ?????? 1????
        uint8 marketsFlg;
    }

    /// @dev Rocs???
    Roc[] public rocs;

    // rocId?tokenId??????
    mapping(uint => uint) public rocIndex;
    // rocId??tokenId???
    function getRocIdToTokenId(uint _rocId) public view returns (uint) {
        return rocIndex[_rocId];
    }

    /// @dev ???????????????
    mapping (uint => address) public rocIndexToOwner;
    // @dev ?????????????????????????
    mapping (address => uint) public ownershipTokenCount;
    /// @dev ?????????????????????
    mapping (uint => address) public rocIndexToApproved;

    /// @dev ???Roc?????????????????
    function _transfer(address _from, address _to, uint256 _tokenId) internal {
        ownershipTokenCount[_to]++;
        ownershipTokenCount[_from]--;
        rocIndexToOwner[_tokenId] = _to;
        // ??????
        emit Transfer(_from, _to, _tokenId);
    }

}

/// @title ERC-721????????????????????????????
contract ERC721 {
    // ????
    event Transfer(address indexed _from, address indexed _to, uint256 _tokenId);
    event Approval(address indexed _owner, address indexed _approved, uint256 _tokenId);

    // ???????
    function balanceOf(address _owner) public view returns (uint256 _balance);
    function ownerOf(uint256 _tokenId) external view returns (address _owner);
    function approve(address _to, uint256 _tokenId) external;
    function transfer(address _to, uint256 _tokenId) public;
    function transferFrom(address _from, address _to, uint256 _tokenId) public;
    function totalSupply() public view returns (uint);

    // ERC-165 Compatibility (https://github.com/ethereum/EIPs/issues/165)
    function supportsInterface(bytes4 _interfaceID) external view returns (bool);
}

/// @title Roc??????????????
/// @dev OpenZeppelin?ERC721?????????
contract RocsOwnership is RocsBase, ERC721 {

    /// @notice ERC721????????????????????????????
    string public constant name = "CryptoFeather";
    string public constant symbol = "CFE";

    bytes4 constant InterfaceSignature_ERC165 = 
    bytes4(keccak256('supportsInterface(bytes4)'));

    bytes4 constant InterfaceSignature_ERC721 =
    bytes4(keccak256('name()')) ^
    bytes4(keccak256('symbol()')) ^
    bytes4(keccak256('balanceOf(address)')) ^
    bytes4(keccak256('ownerOf(uint256)')) ^
    bytes4(keccak256('approve(address,uint256)')) ^
    bytes4(keccak256('transfer(address,uint256)')) ^
    bytes4(keccak256('transferFrom(address,address,uint256)')) ^
    bytes4(keccak256('totalSupply()'));

    /// @notice Introspection interface as per ERC-165 (https://github.com/ethereum/EIPs/issues/165).
    ///  ???????????????????????????true??????
    function supportsInterface(bytes4 _interfaceID) external view returns (bool)
    {
        // DEBUG ONLY
        //require((InterfaceSignature_ERC165 == 0x01ffc9a7) && (InterfaceSignature_ERC721 == 0x9a20483d));
        return ((_interfaceID == InterfaceSignature_ERC165) || (_interfaceID == InterfaceSignature_ERC721));
    }

    /// @dev ?????????????roc???????????????????????
    /// @param _claimant 
    /// @param _tokenId 
    function _owns(address _claimant, uint256 _tokenId) internal view returns (bool) {
        return rocIndexToOwner[_tokenId] == _claimant;
    }

    /// @dev ?????????????roc??????????????????
    /// @param _claimant the address we are confirming kitten is approved for.
    /// @param _tokenId kitten id, only valid when > 0
    function _approvedFor(address _claimant, uint256 _tokenId) internal view returns (bool) {
        return rocIndexToApproved[_tokenId] == _claimant;
    }

    /// @dev ????????????transferFrom???????????????????????
    function _approve(uint256 _tokenId, address _approved) internal {
        rocIndexToApproved[_tokenId] = _approved;
    }

    // ??????????roc????????
    function balanceOf(address _owner) public view returns (uint256 count) {
        return ownershipTokenCount[_owner];
    }

    /// @notice roc???????????
    /// @dev ERC-721???????
    function transfer(address _to, uint256 _tokenId) public whenNotPaused {
        // ??????
        require(_to != address(0));
        // ???roc?????????????
        require(_owns(msg.sender, _tokenId));
        // ??????????????????????????????
        _transfer(msg.sender, _to, _tokenId);
    }

    /// @notice transferFrom????????????????roc?????????????
    /// @dev ERC-721???????
    function approve(address _to, uint256 _tokenId) external whenNotPaused {
        // ??????????????????????
        require(_owns(msg.sender, _tokenId));
        // ???????????????????????
        _approve(_tokenId, _to);
        // ????????????
        emit Approval(msg.sender, _to, _tokenId);
    }

    /// @notice roc??????????????????????????????????????????????????
    /// @dev ERC-721???????
    function transferFrom(address _from, address _to, uint256 _tokenId) public whenNotPaused {
        // ???????
        require(_to != address(0));
        // ????????????
        require(_approvedFor(msg.sender, _tokenId));
        require(_owns(_from, _tokenId));
        // ???????????????????????????????????????
        _transfer(_from, _to, _tokenId);
    }

    /// @notice ??????roc?????????
    /// @dev ERC-721??????????
    function totalSupply() public view returns (uint) {
        return rocs.length - 1;
    }

    /// @notice ?????roc??????????????????????????
    /// @dev ERC-721??????????
    function ownerOf(uint256 _tokenId) external view returns (address owner) {
        owner = rocIndexToOwner[_tokenId];
        require(owner != address(0));
    }

    /// @dev ??????????????NFT?????????
    /// @param _owner 
    /// @param _tokenId 
    function _escrow(address _owner, uint256 _tokenId) internal {
        // it will throw if transfer fails
        transferFrom(_owner, this, _tokenId);
    }

}

/// @title Roc??????????????????
contract RocsBreeding is RocsOwnership {

    /// @notice ???Roc???????? 
    /// @param _rocId 
    /// @param _dna 
    /// @param _marketsFlg 
    /// @param _owner 
    /// @dev RocCreated?????Transfer?????????????? 
    function _createRoc(
        uint _rocId,
        string _dna,
        uint _marketsFlg,
        address _owner
    )
        internal
        returns (uint)
    {
        Roc memory _roc = Roc({
            rocId: _rocId,
            dna: _dna,
            marketsFlg: uint8(_marketsFlg)
        });

        uint newRocId = rocs.push(_roc) - 1;
        // ???????ID????????????????
        require(newRocId == uint(newRocId));
        // RocCreated????
        emit RocCreated(_owner, newRocId, _rocId);

        // ????????????????ERC721????????????????????
        rocIndex[_rocId] = newRocId;
        _transfer(0, _owner, newRocId);

        return newRocId;
    }

    /// @notice ????????? 
    /// @param _rocId 
    /// @param _dna 
    function giveProduce(uint _rocId, string _dna)
        external
        payable
        whenNotPaused
        returns(uint)
    {
        // ??????????
        require(msg.value >= eggPrice);
        uint createRocId = _createRoc(
            _rocId,
            _dna, 
            0, 
            msg.sender
        );
        // ??????????
        uint256 bidExcess = msg.value - eggPrice;
        msg.sender.transfer(bidExcess);

        return createRocId;
    }

    /// @notice ????Roc 
    /// @param _rocId 
    /// @param _dna 
    function freeGiveProduce(uint _rocId, string _dna)
        external
        payable
        whenNotPaused
        returns(uint)
    {
        // ????Roc???????
        require(balanceOf(msg.sender) == 0);
        uint createRocId = _createRoc(
            _rocId,
            _dna, 
            0, 
            msg.sender
        );
        // ??????????
        uint256 bidExcess = msg.value;
        msg.sender.transfer(bidExcess);

        return createRocId;
    }

}

/// @title Roc???????Markets??
contract RocsMarkets is RocsBreeding {

    event MarketsCreated(uint256 tokenId, uint128 marketsPrice);
    event MarketsSuccessful(uint256 tokenId, uint128 marketsPriceice, address buyer);
    event MarketsCancelled(uint256 tokenId);

    // NFT???????????
    struct Markets {
        // ????NFT??
        address seller;
        // ??
        uint128 marketsPrice;
    }

    // ????ID???????????????????????
    mapping (uint256 => Markets) tokenIdToMarkets;

    // ????????????????
    uint256 public ownerCut = 0;
    function setOwnerCut(uint256 _cut) public onlyOwner {
        require(_cut <= 10000);
        ownerCut = _cut;
    }

    /// @notice Roc????????????????????
    /// @param _rocId 
    /// @param _marketsPrice 
    function createRocSaleMarkets(
        uint256 _rocId,
        uint256 _marketsPrice
    )
        external
        whenNotPaused
    {
        require(_marketsPrice == uint256(uint128(_marketsPrice)));

        // ??????tokenId????
        uint checkTokenId = getRocIdToTokenId(_rocId);

        // check?????????
        require(_owns(msg.sender, checkTokenId));
        // check??????????
        Roc memory roc = rocs[checkTokenId];
        // ????????????????????
        require(uint8(roc.marketsFlg) == 0);
        // ??
        _approve(checkTokenId, msg.sender);
        // ????????????
        _escrow(msg.sender, checkTokenId);
        Markets memory markets = Markets(
            msg.sender,
            uint128(_marketsPrice)
        );

        // ?????????FLG????
        rocs[checkTokenId].marketsFlg = 1;
        _addMarkets(checkTokenId, markets);
    }

    /// @dev ???????????????????????????????? 
    ///  ???MarketsCreated????????????
    /// @param _tokenId The ID of the token to be put on markets.
    /// @param _markets Markets to add.
    function _addMarkets(uint256 _tokenId, Markets _markets) internal {
        tokenIdToMarkets[_tokenId] = _markets;
        emit MarketsCreated(
            uint256(_tokenId),
            uint128(_markets.marketsPrice)
        );
    }

    /// @dev ?????????????????????????????????
    /// @param _tokenId 
    function _removeMarkets(uint256 _tokenId) internal {
        delete tokenIdToMarkets[_tokenId];
    }

    /// @dev ?????????????????????
    /// @param _tokenId 
    function _cancelMarkets(uint256 _tokenId) internal {
        _removeMarkets(_tokenId);
        emit MarketsCancelled(_tokenId);
    }

    /// @dev ??????????Markets??????????
    ///  ??????NFT??????
    /// @notice ????????????????????????????????????
    /// @param _rocId 
    function cancelMarkets(uint _rocId) external {
        uint checkTokenId = getRocIdToTokenId(_rocId);
        Markets storage markets = tokenIdToMarkets[checkTokenId];
        address seller = markets.seller;
        require(msg.sender == seller);
        _cancelMarkets(checkTokenId);
        rocIndexToOwner[checkTokenId] = seller;
        rocs[checkTokenId].marketsFlg = 0;
    }

    /// @dev ?????????????Markets??????????
    ///  ?????????????????NFT??????????? 
    ///  ???????????????
    /// @param _rocId 
    function cancelMarketsWhenPaused(uint _rocId) whenPaused onlyOwner external {
        uint checkTokenId = getRocIdToTokenId(_rocId);
        Markets storage markets = tokenIdToMarkets[checkTokenId];
        address seller = markets.seller;
        _cancelMarkets(checkTokenId);
        rocIndexToOwner[checkTokenId] = seller;
        rocs[checkTokenId].marketsFlg = 0;
    }

    /// @dev Markets??
    ///  ?????Ether???????NFT??????????
    /// @param _rocId 
    function bid(uint _rocId) external payable whenNotPaused {
        uint checkTokenId = getRocIdToTokenId(_rocId);
        // ?????????????????????
        Markets storage markets = tokenIdToMarkets[checkTokenId];

        uint128 sellingPrice = uint128(markets.marketsPrice);
        // ??????????????????
        // msg.value?wei??
        require(msg.value >= sellingPrice);
        // ???????????????????????????????????
        address seller = markets.seller;

        // ????????????????
        _removeMarkets(checkTokenId);

        if (sellingPrice > 0) {
            // ??????????????
            uint128 marketseerCut = uint128(_computeCut(sellingPrice));
            uint128 sellerProceeds = sellingPrice - marketseerCut;

            // ????????
            seller.transfer(sellerProceeds);
        }

        // ??????????
        msg.sender.transfer(msg.value - sellingPrice);
        // ????
        emit MarketsSuccessful(checkTokenId, sellingPrice, msg.sender);

        _transfer(seller, msg.sender, checkTokenId);
        // ?????????FLG????
        rocs[checkTokenId].marketsFlg = 0;
    }

    /// @dev ?????
    /// @param _price 
    function _computeCut(uint128 _price) internal view returns (uint) {
        return _price * ownerCut / 10000;
    }

}

/// @title CryptoRocs
contract RocsCore is RocsMarkets {

    // ???????????????????????????
    address public newContractAddress;

    /// @dev ????????????????????????????????????????????????
    function unpause() public onlyOwner whenPaused {
        require(newContractAddress == address(0));
        // ???????????????????
        super.unpause();
    }

    // @dev ????????????????????
    function withdrawBalance(uint _subtractFees) external onlyOwner {
        uint256 balance = address(this).balance;
        if (balance > _subtractFees) {
            owner.transfer(balance - _subtractFees);
        }
    }

    /// @notice tokenId??Roc??????????????????
    /// @param _tokenId ????ID
    function getRoc(uint _tokenId)
        external
        view
        returns (
        uint rocId,
        string dna,
        uint marketsFlg
    ) {
        Roc memory roc = rocs[_tokenId];
        rocId = uint(roc.rocId);
        dna = string(roc.dna);
        marketsFlg = uint(roc.marketsFlg);
    }

    /// @notice rocId??Roc??????????????????
    /// @param _rocId rocId
    function getRocrocId(uint _rocId)
        external
        view
        returns (
        uint rocId,
        string dna,
        uint marketsFlg
    ) {
        Roc memory roc = rocs[getRocIdToTokenId(_rocId)];
        rocId = uint(roc.rocId);
        dna = string(roc.dna);
        marketsFlg = uint(roc.marketsFlg);
    }

    /// @notice rocId??Markets????????
    /// @param _rocId rocId
    function getMarketsRocId(uint _rocId)
        external
        view
        returns (
        address seller,
        uint marketsPrice
    ) {
        uint checkTokenId = getRocIdToTokenId(_rocId);
        Markets memory markets = tokenIdToMarkets[checkTokenId];
        seller = markets.seller;
        marketsPrice = uint(markets.marketsPrice);
    }

    /// @notice rocId??????????????
    /// @param _rocId rocId
    function getRocIndexToOwner(uint _rocId)
        external
        view
        returns (
        address owner
    ) {
        uint checkTokenId = getRocIdToTokenId(_rocId);
        owner = rocIndexToOwner[checkTokenId];
    }

}