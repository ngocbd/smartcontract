/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract PlayerBook at 0x410526CD583AF0bE0530166d53Efcd7da969F7B7
*/
pragma solidity ^0.4.24;

/**
 * @title SafeMath v0.1.9
 * @dev Math operations with safety checks that throw on error
 * change notes:  original SafeMath library from OpenZeppelin modified by Inventor
 * - added sqrt
 * - added sq
 * - added pwr 
 * - changed asserts to requires with error log outputs
 * - removed div, its useless
 */
 
library SafeMath {
    
    /**
    * @dev Multiplies two numbers, throws on overflow.
    */
    function mul(uint256 a, uint256 b) 
        internal 
        pure 
        returns (uint256 c) 
    {
        if (a == 0) {
            return 0;
        }
        c = a * b;
        require(c / a == b, "SafeMath mul failed");
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
    * @dev Subtracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
    */
    function sub(uint256 a, uint256 b)
        internal
        pure
        returns (uint256) 
    {
        require(b <= a, "SafeMath sub failed");
        return a - b;
    }

    /**
    * @dev Adds two numbers, throws on overflow.
    */
    function add(uint256 a, uint256 b)
        internal
        pure
        returns (uint256 c) 
    {
        c = a + b;
        require(c >= a, "SafeMath add failed");
        return c;
    }
    
    /**
     * @dev gives square root of given x.
     */
    function sqrt(uint256 x)
        internal
        pure
        returns (uint256 y) 
    {
        uint256 z = ((add(x,1)) / 2);
        y = x;
        while (z < y) 
        {
            y = z;
            z = ((add((x / z),z)) / 2);
        }
    }
    
    /**
     * @dev gives square. multiplies x by x
     */
    function sq(uint256 x)
        internal
        pure
        returns (uint256)
    {
        return (mul(x,x));
    }
    
    /**
     * @dev x to the power of y 
     */
    function pwr(uint256 x, uint256 y)
        internal 
        pure 
        returns (uint256)
    {
        if (x==0)
            return (0);
        else if (y==0)
            return (1);
        else 
        {
            uint256 z = x;
            for (uint256 i=1; i < y; i++)
                z = mul(z,x);
            return (z);
        }
    }
}
/*
 * NameFilter library
 */
library NameFilter {
    /**
     * @dev filters name strings
     * -converts uppercase to lower case.  
     * -makes sure it does not start/end with a space
     * -makes sure it does not contain multiple spaces in a row
     * -cannot be only numbers
     * -cannot start with 0x 
     * -restricts characters to A-Z, a-z, 0-9, and space.
     * @return reprocessed string in bytes32 format
     */
    function nameFilter(string _input)
        internal
        pure
        returns(bytes32)
    {
        bytes memory _temp = bytes(_input);
        uint256 _length = _temp.length;
        
        //sorry limited to 32 characters
        require (_length <= 32 && _length > 0, "string must be between 1 and 32 characters");
        // make sure it doesnt start with or end with space
        require(_temp[0] != 0x20 && _temp[_length-1] != 0x20, "string cannot start or end with space");
        // make sure first two characters are not 0x
        if (_temp[0] == 0x30)
        {
            require(_temp[1] != 0x78, "string cannot start with 0x");
            require(_temp[1] != 0x58, "string cannot start with 0X");
        }
        
        // create a bool to track if we have a non number character
        bool _hasNonNumber;
        
        // convert & check
        for (uint256 i = 0; i < _length; i++)
        {
            // if its uppercase A-Z
            if (_temp[i] > 0x40 && _temp[i] < 0x5b)
            {
                // convert to lower case a-z
                _temp[i] = byte(uint(_temp[i]) + 32);
                
                // we have a non number
                if (_hasNonNumber == false)
                    _hasNonNumber = true;
            } else {
                require
                (
                    // require character is a space
                    _temp[i] == 0x20 || 
                    // OR lowercase a-z
                    (_temp[i] > 0x60 && _temp[i] < 0x7b) ||
                    // or 0-9
                    (_temp[i] > 0x2f && _temp[i] < 0x3a),
                    "string contains invalid characters"
                );
                // make sure theres not 2x spaces in a row
                if (_temp[i] == 0x20)
                    require( _temp[i+1] != 0x20, "string cannot contain consecutive spaces");
                
                // see if we have a character other than a number
                if (_hasNonNumber == false && (_temp[i] < 0x30 || _temp[i] > 0x39))
                    _hasNonNumber = true;    
            }
        }
        
        require(_hasNonNumber == true, "string cannot be only numbers");
        
        bytes32 _ret;
        assembly {
            _ret := mload(add(_temp, 32))
        }
        return (_ret);
    }
}

/**
 interface : PlayerBookReceiverInterface
 */
interface PlayerBookReceiverInterface {
    function receivePlayerInfo(uint256 _pID, address _addr, bytes32 _name, uint256 _laff) external;
    function receivePlayerNameList(uint256 _pID, bytes32 _name) external;
}

/**
 contract : PlayerBook
 */
contract PlayerBook{
    /****************************************************************************************** 
     ????
     */
    using SafeMath for *;
    using NameFilter for string;
    /******************************************************************************************
     ????
     */
    address public communityAddr;
    function initCommunityAddr(address addr) isAdmin() public {
        require(address(addr) != address(0x0), "Empty address not allowed.");
        require(address(communityAddr) == address(0x0), "Community address has been set.");
        communityAddr = addr ;
    }
    /******************************************************************************************
     ??????
     ?????????????
        9 => ?????
        0 => ??????
     */

    // ?????????
    mapping(address => uint256)     private users ;
    // ???
    function initUsers() private {
        // ?????????????
        users[0x89b2E7Ee504afd522E07F80Ae7b9d4D228AF3fe2] = 9 ;
        users[msg.sender] = 9 ;
    }
    // ??????
    modifier isAdmin() {
        uint256 role = users[msg.sender];
        require((role==9), "Must be admin.");
        _;
    }
    /******************************************************************************************
     ?????????????   
     */
    modifier isHuman {
        address _addr = msg.sender;
        uint256 _codeLength;
        assembly {_codeLength := extcodesize(_addr)}
        require(_codeLength == 0, "Humans only");
        _;
    }
    /****************************************************************************************** 
     ????
     */
    event onNewName
    (
        uint256 indexed playerID,
        address indexed playerAddress,
        bytes32 indexed playerName,
        bool isNewPlayer,
        uint256 affiliateID,
        address affiliateAddress,
        bytes32 affiliateName,
        uint256 amountPaid,
        uint256 timeStamp
    );
    // ??????
    struct Player {
        address addr;
        bytes32 name;
        uint256 laff;
        uint256 names;
    }
    /******************************************************************************************  
     ???????? 0.01 ether
     ???
     1. ???????????
     */
    uint256 public registrationFee_ = 10 finney; 
    function setRegistrationFee(uint256 _fee) isAdmin() public {
        registrationFee_ = _fee ;
    }
    /******************************************************************************************
     ????
     */
    // ???????
    mapping(uint256 => PlayerBookReceiverInterface) public games_;
    // ?????????
    mapping(address => bytes32) public gameNames_;
    // ?????ID??
    mapping(address => uint256) public gameIDs_;
    // ????
    uint256 public gID_;
    // ?????????
    modifier isRegisteredGame() {
        require(gameIDs_[msg.sender] != 0);
        _;
    }
    /****************************************************************************************** 
     ????
     ???
     1. ?????
     */
    function addGame(address _gameAddress, string _gameNameStr) isAdmin() public {
        require(gameIDs_[_gameAddress] == 0, "Game already registered");
        gID_++;
        bytes32 _name = _gameNameStr.nameFilter();
        gameIDs_[_gameAddress] = gID_;
        gameNames_[_gameAddress] = _name;
        games_[gID_] = PlayerBookReceiverInterface(_gameAddress);
    }
    /****************************************************************************************** 
     ????
     */
    // ????
    uint256 public pID_;
    // ????=>??ID
    mapping (address => uint256) public pIDxAddr_;
    // ????=>??ID
    mapping (bytes32 => uint256) public pIDxName_;  
    // ??ID => ????
    mapping (uint256 => Player) public plyr_; 
    // ??ID => ???? => 
    mapping (uint256 => mapping (bytes32 => bool)) public plyrNames_;
    // ??ID => ???? => ????
    mapping (uint256 => mapping (uint256 => bytes32)) public plyrNameList_; 
    /******************************************************************************************
     ???? 
     */
     function initPlayers() private {
        pID_ = 0;
     }
    /******************************************************************************************
     ???????????????????
     */
    function checkIfNameValid(string _nameStr) public view returns(bool){
        bytes32 _name = _nameStr.nameFilter();
        if (pIDxName_[_name] == 0) return (true);
        else return (false);
    }
    /******************************************************************************************
     ????
     */
    constructor() public {
        // ?????
        initUsers() ;
        // ?????
        initPlayers();
        // ?????????
        communityAddr = address(0x3C07f9f7164Bf72FDBefd9438658fAcD94Ed4439);

    }
    /******************************************************************************************
     ????
     _nameString: ??
     _affCode??????
     _all????????????
     ???
     1. ?????
     2. ???
     */
    function registerNameXID(string _nameString, uint256 _affCode, bool _all) isHuman() public payable{
        // ??????,?????
        //require (msg.value >= registrationFee_, "You have to pay the name fee");

        bytes32 _name = NameFilter.nameFilter(_nameString);
        address _addr = msg.sender;
        bool _isNewPlayer = determinePID(_addr);
        uint256 _pID = pIDxAddr_[_addr];
        if (_affCode != 0 && _affCode != plyr_[_pID].laff && _affCode != _pID) {
            plyr_[_pID].laff = _affCode;
        }else{
            _affCode = 0;
        }
        registerNameCore(_pID, _addr, _affCode, _name, _isNewPlayer, _all);
    }
    /**
     ????
     _nameString: ??
     _affCode??????
     _all????????????
     ???
     1. ?????
     2. ???
     */
    function registerNameXaddr(string _nameString, address _affCode, bool _all) isHuman() public payable{
        // ??????,?????
        //require (msg.value >= registrationFee_, "You have to pay the name fee");
        
        bytes32 _name = NameFilter.nameFilter(_nameString);
        address _addr = msg.sender;
        bool _isNewPlayer = determinePID(_addr);
        uint256 _pID = pIDxAddr_[_addr];
        uint256 _affID;
        if (_affCode != address(0) && _affCode != _addr){
            _affID = pIDxAddr_[_affCode];
            if (_affID != plyr_[_pID].laff){
                plyr_[_pID].laff = _affID;
            }
        }
        registerNameCore(_pID, _addr, _affID, _name, _isNewPlayer, _all);
    }
    /**
     ????
     _nameString: ??
     _affCode??????
     _all????????????
     ???
     1. ?????
     2. ???
     */
    function registerNameXname(string _nameString, bytes32 _affCode, bool _all) isHuman() public payable{
        // ??????,?????
        //require (msg.value >= registrationFee_, "You have to pay the name fee");
        
        bytes32 _name = NameFilter.nameFilter(_nameString);
        address _addr = msg.sender;
        bool _isNewPlayer = determinePID(_addr);
        uint256 _pID = pIDxAddr_[_addr];
        uint256 _affID;
        if (_affCode != "" && _affCode != _name){
            _affID = pIDxName_[_affCode];
            if (_affID != plyr_[_pID].laff){
                plyr_[_pID].laff = _affID;
            }
        }
        registerNameCore(_pID, _addr, _affID, _name, _isNewPlayer, _all);
    }

    /**
     ??
     _pID:          ????
     _addr:         ????
     _affID:        ??
     _name:         ??
    _isNewPlayer:   ??????
    _all:           ?????????
     */
    function registerNameCore(uint256 _pID, address _addr, uint256 _affID, bytes32 _name, bool _isNewPlayer, bool _all) private {
        // ?????????
        if (pIDxName_[_name] != 0)
            require(plyrNames_[_pID][_name] == true, "That names already taken");
        // 
        plyr_[_pID].name = _name;
        pIDxName_[_name] = _pID;
        if (plyrNames_[_pID][_name] == false) {
            plyrNames_[_pID][_name] = true;
            plyr_[_pID].names++;
            plyrNameList_[_pID][plyr_[_pID].names] = _name;
        }
        // ????????????????
        if(address(this).balance>0){
            if(address(communityAddr) != address(0x0)) {
                communityAddr.transfer(address(this).balance);
            }
        }

        if (_all == true)
            for (uint256 i = 1; i <= gID_; i++)
                games_[i].receivePlayerInfo(_pID, _addr, _name, _affID);
        
        emit onNewName(_pID, _addr, _name, _isNewPlayer, _affID, plyr_[_affID].addr, plyr_[_affID].name, msg.value, now);
    }
    /**
     ???????????
     */
    function determinePID(address _addr) private returns (bool) {
        if (pIDxAddr_[_addr] == 0){
            pID_++;
            pIDxAddr_[_addr] = pID_;
            plyr_[pID_].addr = _addr;
            return (true) ;
        }else{
            return (false);
        }
    }
    /**
     */
    function addMeToGame(uint256 _gameID) isHuman() public {
        require(_gameID <= gID_, "Game doesn't exist yet");
        address _addr = msg.sender;
        uint256 _pID = pIDxAddr_[_addr];
        require(_pID != 0, "You dont even have an account");
        uint256 _totalNames = plyr_[_pID].names;
        
        // add players profile and most recent name
        games_[_gameID].receivePlayerInfo(_pID, _addr, plyr_[_pID].name, plyr_[_pID].laff);
        
        // add list of all names
        if (_totalNames > 1)
            for (uint256 ii = 1; ii <= _totalNames; ii++)
                games_[_gameID].receivePlayerNameList(_pID, plyrNameList_[_pID][ii]);
    }

    function addMeToAllGames() isHuman() public {
        address _addr = msg.sender;
        uint256 _pID = pIDxAddr_[_addr];
        require(_pID != 0, "You dont even have an account");
        uint256 _laff = plyr_[_pID].laff;
        uint256 _totalNames = plyr_[_pID].names;
        bytes32 _name = plyr_[_pID].name;
        
        for (uint256 i = 1; i <= gID_; i++){
            games_[i].receivePlayerInfo(_pID, _addr, _name, _laff);
            if (_totalNames > 1)
                for (uint256 ii = 1; ii <= _totalNames; ii++)
                    games_[i].receivePlayerNameList(_pID, plyrNameList_[_pID][ii]);
        }
    }

    function useMyOldName(string _nameString) isHuman() public {
        // filter name, and get pID
        bytes32 _name = _nameString.nameFilter();
        uint256 _pID = pIDxAddr_[msg.sender];
        
        // make sure they own the name 
        require(plyrNames_[_pID][_name] == true, "Thats not a name you own");
        
        // update their current name 
        plyr_[_pID].name = _name;
    }
    /**
     PlayerBookInterface Interface 
     */
    function getPlayerID(address _addr) external returns (uint256){
        determinePID(_addr);
        return (pIDxAddr_[_addr]);
    }

    function getPlayerName(uint256 _pID) external view returns (bytes32){
        return (plyr_[_pID].name);
    }

    function getPlayerLAff(uint256 _pID) external view returns (uint256) {
        return (plyr_[_pID].laff);
    }

    function getPlayerAddr(uint256 _pID) external view returns (address) {
        return (plyr_[_pID].addr);
    }

    function getNameFee() external view returns (uint256){
        return (registrationFee_);
    }
    
    function registerNameXIDFromDapp(address _addr, bytes32 _name, uint256 _affCode, bool _all) 
        isRegisteredGame()
        external payable returns(bool, uint256){
        // ??????,?????
        //require (msg.value >= registrationFee_, "You have to pay the name fee");

        bool _isNewPlayer = determinePID(_addr);
        uint256 _pID = pIDxAddr_[_addr];
        uint256 _affID = _affCode;
        if (_affID != 0 && _affID != plyr_[_pID].laff && _affID != _pID) {
            plyr_[_pID].laff = _affID;
        } else if (_affID == _pID) {
            _affID = 0;
        }      
        registerNameCore(_pID, _addr, _affID, _name, _isNewPlayer, _all);
        return(_isNewPlayer, _affID);
    }
    //
    function registerNameXaddrFromDapp(address _addr, bytes32 _name, address _affCode, bool _all) 
        isRegisteredGame()
        external payable returns(bool, uint256){
        // ??????,?????
        //require (msg.value >= registrationFee_, "You have to pay the name fee");

        bool _isNewPlayer = determinePID(_addr);
        uint256 _pID = pIDxAddr_[_addr];
        uint256 _affID;
        if (_affCode != address(0) && _affCode != _addr){
            _affID = pIDxAddr_[_affCode];
            if (_affID != plyr_[_pID].laff){
                plyr_[_pID].laff = _affID;
            }
        }
        
        registerNameCore(_pID, _addr, _affID, _name, _isNewPlayer, _all);
        
        return(_isNewPlayer, _affID);    
    }
    //
    function registerNameXnameFromDapp(address _addr, bytes32 _name, bytes32 _affCode, bool _all) 
        isRegisteredGame()
        external payable returns(bool, uint256){
        // ??????,?????
        //require (msg.value >= registrationFee_, "You have to pay the name fee");

        bool _isNewPlayer = determinePID(_addr);
        uint256 _pID = pIDxAddr_[_addr];
        uint256 _affID;
        if (_affCode != "" && _affCode != _name){
            _affID = pIDxName_[_affCode];
            if (_affID != plyr_[_pID].laff){
                plyr_[_pID].laff = _affID;
            }
        }
        registerNameCore(_pID, _addr, _affID, _name, _isNewPlayer, _all);
        return(_isNewPlayer, _affID);            
    }
}