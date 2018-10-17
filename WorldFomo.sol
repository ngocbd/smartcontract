/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract WorldFomo at 0xa9cd85313cb403c25a49fe9c2bd83e3e8fc0d6aa
*/
pragma solidity ^0.4.24;
/**
*                                        ,   ,
*                                        $,  $,     ,
*                                        "ss.$ss. .s'
*                                ,     .ss$$$$$$$$$$s,
*                                $. s$$$$$$$$$$$$$$`$$Ss
*                                "$$$$$$$$$$$$$$$$$$o$$$       ,
*                               s$$$$$$$$$$$$$$$$$$$$$$$$s,  ,s
*                              s$$$$$$$$$"$$$$$$""""$$$$$$"$$$$$,
*                              s$$$$$$$$$$s""$$$$ssssss"$$$$$$$$"
*                             s$$$$$$$$$$'         `"""ss"$"$s""
*                             s$$$$$$$$$$,              `"""""$  .s$$s
*                             s$$$$$$$$$$$$s,...               `s$$'  `
*                         `ssss$$$$$$$$$$$$$$$$$$$$####s.     .$$"$.   , s-
*                           `""""$$$$$$$$$$$$$$$$$$$$#####$$$$$$"     $.$'
* ????                        "$$$$$$$$$$$$$$$$$$$$$####s""     .$$$|
*   ?    ??                        "$$$$$$$$$$$$$$$$$$$$$$$$##s    .$$" $
*                                   $$""$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"   `
*                                  $$"  "$"$$$$$$$$$$$$$$$$$$$$S""""'
*                             ,   ,"     '  $$$$$$$$$$$$$$$$####s
*                             $.          .s$$$$$$$$$$$$$$$$$####"
*                 ,           "$s.   ..ssS$$$$$$$$$$$$$$$$$$$####"
*                 $           .$$$S$$$$$$$$$$$$$$$$$$$$$$$$#####"
*                 Ss     ..sS$$$$$$$$$$$$$$$$$$$$$$$$$$$######""
*                  "$$sS$$$$$$$$$$$$$$$$$$$$$$$$$$$########"
*           ,      s$$$$$$$$$$$$$$$$$$$$$$$$#########""'
*           $    s$$$$$$$$$$$$$$$$$$$$$#######""'      s'         ,
*           $$..$$$$$$$$$$$$$$$$$$######"'       ....,$$....    ,$
*            "$$$$$$$$$$$$$$$######"' ,     .sS$$$$$$$$$$$$$$$$s$$
*              $$$$$$$$$$$$#####"     $, .s$$$$$$$$$$$$$$$$$$$$$$$$s.
*   )          $$$$$$$$$$$#####'      `$$$$$$$$$###########$$$$$$$$$$$.
*  ((          $$$$$$$$$$$#####       $$$$$$$$###"       "####$$$$$$$$$$
*  ) \         $$$$$$$$$$$$####.     $$$$$$###"             "###$$$$$$$$$   s'
* (   )        $$$$$$$$$$$$$####.   $$$$$###"                ####$$$$$$$$s$$'
* )  ( (       $$"$$$$$$$$$$$#####.$$$$$###'                .###$$$$$$$$$$"
* (  )  )   _,$"   $$$$$$$$$$$$######.$$##'                .###$$$$$$$$$$
* ) (  ( \.         "$$$$$$$$$$$$$#######,,,.          ..####$$$$$$$$$$$"
*(   )$ )  )        ,$$$$$$$$$$$$$$$$$$####################$$$$$$$$$$$"
*(   ($$  ( \     _sS"  `"$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$S$$,
* )  )$$$s ) )  .      .   `$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"'  `$$
*  (   $$$Ss/  .$,    .$,,s$$$$$$##S$$$$$$$$$$$$$$$$$$$$$$$$S""        '
*    \)_$$$$$$$$$$$$$$$$$$$$$$$##"  $$        `$$.        `$$.
*        `"S$$$$$$$$$$$$$$$$$#"      $          `$          `$
*            `"""""""""""""'         '           '           '
*/
contract F3Devents {
    // ??????????????
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

    // ???????????
    event onEndTx
    (
        uint256 compressedData,
        uint256 compressedIDs,
        bytes32 playerName,
        address playerAddress,
        uint256 ethIn,
        uint256 keysBought,
        address winnerAddr,
        bytes32 winnerName,
        uint256 amountWon,
        uint256 newPot,
        uint256 P3DAmount,
        uint256 genAmount,
        uint256 potAmount,
        uint256 airDropPot
    );

    // ???????????
    event onWithdraw
    (
        uint256 indexed playerID,
        address playerAddress,
        bytes32 playerName,
        uint256 ethOut,
        uint256 timeStamp
    );

    // ???????????????
    event onWithdrawAndDistribute
    (
        address playerAddress,
        bytes32 playerName,
        uint256 ethOut,
        uint256 compressedData,
        uint256 compressedIDs,
        address winnerAddr,
        bytes32 winnerName,
        uint256 amountWon,
        uint256 newPot,
        uint256 P3DAmount,
        uint256 genAmount
    );

    // (fomo3d??) ?????????????????????
    // ???????????
    event onBuyAndDistribute
    (
        address playerAddress,
        bytes32 playerName,
        uint256 ethIn,
        uint256 compressedData,
        uint256 compressedIDs,
        address winnerAddr,
        bytes32 winnerName,
        uint256 amountWon,
        uint256 newPot,
        uint256 P3DAmount,
        uint256 genAmount
    );

    // (fomo3d??) ?????????????????????
    // ???????????.
    event onReLoadAndDistribute
    (
        address playerAddress,
        bytes32 playerName,
        uint256 compressedData,
        uint256 compressedIDs,
        address winnerAddr,
        bytes32 winnerName,
        uint256 amountWon,
        uint256 newPot,
        uint256 P3DAmount,
        uint256 genAmount
    );

    // ??????????????
    event onAffiliatePayout
    (
        uint256 indexed affiliateID,
        address affiliateAddress,
        bytes32 affiliateName,
        uint256 indexed roundID,
        uint256 indexed buyerID,
        uint256 amount,
        uint256 timeStamp
    );

    // ????????
    event onPotSwapDeposit
    (
        uint256 roundID,
        uint256 amountAddedToPot
    );
}

//==============================================================================
//   _ _  _ _|_ _ _  __|_   _ _ _|_    _   .
//  (_(_)| | | | (_|(_ |   _\(/_ | |_||_)  .
//====================================|=========================================

contract modularShort is F3Devents {}

contract WorldFomo is modularShort {
    using SafeMath for *;
    using NameFilter for string;
    using F3DKeysCalcShort for uint256;

    PlayerBookInterface constant private PlayerBook = PlayerBookInterface(0x77abd49884c36193e7d1fccc6898fcdbd9d23ecc);

//==============================================================================
//     _ _  _  |`. _     _ _ |_ | _  _  .
//    (_(_)| |~|~|(_||_|| (_||_)|(/__\  .  (????)
//=================_|===========================================================
    address private admin = msg.sender;
    string constant public name = "WorldFomo";
    string constant public symbol = "WF";
    uint256 private rndExtra_ = 15 seconds;     // ???ICO???
    uint256 private rndGap_ = 30 minutes;         // ICO??????EOS???1??
    uint256 constant private rndInit_ = 30 minutes;                // ????????
    uint256 constant private rndInc_ = 10 seconds;              // ??????????????????
    uint256 constant private rndMax_ = 12 hours;                // ?????????????
//==============================================================================
//     _| _ _|_ _    _ _ _|_    _   .
//    (_|(_| | (_|  _\(/_ | |_||_)  .  (??????????????)
//=============================|================================================
    uint256 public airDropPot_;             // ????????????????
    uint256 public airDropTracker_ = 0;     // ??“??”tx???????????????
    uint256 public rID_;    // ??????ID /???
//****************
// ????
//****************
    mapping (address => uint256) public pIDxAddr_;          // ?addr => pID????????ID
    mapping (bytes32 => uint256) public pIDxName_;          // (name => pID????????ID
    mapping (uint256 => F3Ddatasets.Player) public plyr_;   // (pID => data) ????
    mapping (uint256 => mapping (uint256 => F3Ddatasets.PlayerRounds)) public plyrRnds_;    // (pID => rID => data) ??ID???ID??????
    mapping (uint256 => mapping (bytes32 => bool)) public plyrNames_; // (pID => name => bool??????????? ???????????????????????????
//****************
// ????
//****************
    mapping (uint256 => F3Ddatasets.Round) public round_;   // (rID => data) ????
    mapping (uint256 => mapping(uint256 => uint256)) public rndTmEth_;      // (rID => tID => ????????eth?by round id?team id
//****************
// ??????
//****************
    mapping (uint256 => F3Ddatasets.TeamFee) public fees_;          // (team => fees) ???????
    mapping (uint256 => F3Ddatasets.PotSplit) public potSplit_;     // (team => fees) ????????
//==============================================================================
//     _ _  _  __|_ _    __|_ _  _  .
//    (_(_)| |_\ | | |_|(_ | (_)|   .  (????????????)
//==============================================================================
    constructor()
        public
    {
        // ??????
        // 0 = europe
        // 1 = freeforall
        // 2 = china
        // 3 = americas

        // ???????
        // (F3D, P3D) + (Pot , Referrals, Community)
            // ??? / ??????????????????????.
        fees_[0] = F3Ddatasets.TeamFee(32,0);   //50% to pot, 15% to aff, 3% to com, 0% to pot swap, 0% to air drop pot
        fees_[1] = F3Ddatasets.TeamFee(45,0);   //37% to pot, 15% to aff, 3% to com, 0% to pot swap, 0% to air drop pot
        fees_[2] = F3Ddatasets.TeamFee(62,0);  //20% to pot, 15% to aff, 3% to com, 0% to pot swap, 0% to air drop pot
        fees_[3] = F3Ddatasets.TeamFee(47,0);   //35% to pot, 15% to aff, 3% to com, 0% to pot swap, 0% to air drop pot

        // ????????????????
        // (F3D, P3D)
        potSplit_[0] = F3Ddatasets.PotSplit(47,0);  //25% to winner, 25% to next round, 3% to com
        potSplit_[1] = F3Ddatasets.PotSplit(47,0);   //25% to winner, 25% to next round, 3% to com
        potSplit_[2] = F3Ddatasets.PotSplit(62,0);  //25% to winner, 10% to next round, 3% to com
        potSplit_[3] = F3Ddatasets.PotSplit(62,0);  //25% to winner, 10% to next round,3% to com
    }
//==============================================================================
//     _ _  _  _|. |`. _  _ _  .
//    | | |(_)(_||~|~|(/_| _\  .  (????????)
//==============================================================================
    /**
     * @dev ???????????????????.
     *
     */
    modifier isActivated() {
        require(activated_ == true, "its not ready yet.  check ?eta in discord");
        _;
    }

    /**
     * @dev ?????fomo3d??
     */
    modifier isHuman() {
        require(msg.sender == tx.origin, "sorry humans only - FOR REAL THIS TIME");
        _;
    }

    /**
     * @dev ????tx???
     */
    modifier isWithinLimits(uint256 _eth) {
        require(_eth >= 1000000000, "pocket lint: not a valid currency");
        require(_eth <= 100000000000000000000000, "no vitalik, no");
        _;
    }

//==============================================================================
//     _    |_ |. _   |`    _  __|_. _  _  _  .
//    |_)|_||_)||(_  ~|~|_|| |(_ | |(_)| |_\  .  (?????????)
//====|=========================================================================
    /**
     * @dev ?????????????ID?????
     */
    function()
        isActivated()
        isHuman()
        isWithinLimits(msg.value)
        public
        payable
    {
        // ?????tx??????????????
        F3Ddatasets.EventReturns memory _eventData_ = determinePID(_eventData_);

        // ????ID
        uint256 _pID = pIDxAddr_[msg.sender];

        // ???
        buyCore(_pID, plyr_[_pID].laff, 2, _eventData_);
    }

    /**
     * @dev ?????????????.
     * -functionhash- 0x8f38f309 (??ID????)
     * -functionhash- 0x98a0871d (?????????)
     * -functionhash- 0xa65b37a1 (?????????)
     * @param _affCode ??????????ID /??/??
     * @param _team ????????
     */
    function buyXid(uint256 _affCode, uint256 _team)
        isActivated()
        isHuman()
        isWithinLimits(msg.value)
        public
        payable
    {
        // ?????tx??????????????
        F3Ddatasets.EventReturns memory _eventData_ = determinePID(_eventData_);

        // ????ID
        uint256 _pID = pIDxAddr_[msg.sender];

        // ??????
        // ?????????????????????????
        if (_affCode == 0 || _affCode == _pID)
        {
            // ???????????
            _affCode = plyr_[_pID].laff;

        // ???????????????????
        } else if (_affCode != plyr_[_pID].laff) {
            // ????????
            plyr_[_pID].laff = _affCode;
        }

        // ????????????
        _team = verifyTeam(_team);

        // ???
        buyCore(_pID, _affCode, _team, _eventData_);
    }

    function buyXaddr(address _affCode, uint256 _team)
        isActivated()
        isHuman()
        isWithinLimits(msg.value)
        public
        payable
    {
        // ?????tx??????????????
        F3Ddatasets.EventReturns memory _eventData_ = determinePID(_eventData_);

        // ????ID
        uint256 _pID = pIDxAddr_[msg.sender];

        // ??????
        uint256 _affID;
        // ?????????????????????????
        if (_affCode == address(0) || _affCode == msg.sender)
        {
            // ???????????
            _affID = plyr_[_pID].laff;

        // ???????
        } else {
            // ?aff Code????ID
            _affID = pIDxAddr_[_affCode];

            // ??affID????????
            if (_affID != plyr_[_pID].laff)
            {
                // ????????
                plyr_[_pID].laff = _affID;
            }
        }

        // ????????????
        _team = verifyTeam(_team);

        // ???
        buyCore(_pID, _affID, _team, _eventData_);
    }

    function buyXname(bytes32 _affCode, uint256 _team)
        isActivated()
        isHuman()
        isWithinLimits(msg.value)
        public
        payable
    {
        // ?????tx??????????????
        F3Ddatasets.EventReturns memory _eventData_ = determinePID(_eventData_);

        // ????ID
        uint256 _pID = pIDxAddr_[msg.sender];

        // ??????
        uint256 _affID;
        // ?????????????????????????
        if (_affCode == '' || _affCode == plyr_[_pID].name)
        {
            // ???????????
            _affID = plyr_[_pID].laff;

        // ???????
        } else {
            // ?aff Code????ID
            _affID = pIDxName_[_affCode];

            // ??affID????????
            if (_affID != plyr_[_pID].laff)
            {
                // ????????
                plyr_[_pID].laff = _affID;
            }
        }

        // ????????????
        _team = verifyTeam(_team);

        // ???
        buyCore(_pID, _affID, _team, _eventData_);
    }

    /**
     * @dev ????????????????
     * ?????????????????.
     * -functionhash- 0x349cdcac (??ID????)
     * -functionhash- 0x82bfc739 (?????????)
     * -functionhash- 0x079ce327 (?????????)
     * @param _affCode ??????????ID /??/??
     * @param _team ????????
     * @param _eth ????????????????
     */
    function reLoadXid(uint256 _affCode, uint256 _team, uint256 _eth)
        isActivated()
        isHuman()
        isWithinLimits(_eth)
        public
    {
        // ?????tx????
        F3Ddatasets.EventReturns memory _eventData_;

        // ????ID
        uint256 _pID = pIDxAddr_[msg.sender];

        // ??????
        // ?????????????????????????
        if (_affCode == 0 || _affCode == _pID)
        {
            // ???????????
            _affCode = plyr_[_pID].laff;

        // ???????????????????
        } else if (_affCode != plyr_[_pID].laff) {
            // ????????
            plyr_[_pID].laff = _affCode;
        }

        // ????????????
        _team = verifyTeam(_team);

        // ????
        reLoadCore(_pID, _affCode, _team, _eth, _eventData_);
    }

    function reLoadXaddr(address _affCode, uint256 _team, uint256 _eth)
        isActivated()
        isHuman()
        isWithinLimits(_eth)
        public
    {
        // ?????tx????
        F3Ddatasets.EventReturns memory _eventData_;

        // ????ID
        uint256 _pID = pIDxAddr_[msg.sender];

        // ??????
        uint256 _affID;
        // ?????????????????????????
        if (_affCode == address(0) || _affCode == msg.sender)
        {
            // ???????????
            _affID = plyr_[_pID].laff;

        // ???????
        } else {
            // ?aff Code????ID
            _affID = pIDxAddr_[_affCode];

            // ??affID????????
            if (_affID != plyr_[_pID].laff)
            {
                // ????????
                plyr_[_pID].laff = _affID;
            }
        }

        // ????????????
        _team = verifyTeam(_team);

        // ????
        reLoadCore(_pID, _affID, _team, _eth, _eventData_);
    }

    function reLoadXname(bytes32 _affCode, uint256 _team, uint256 _eth)
        isActivated()
        isHuman()
        isWithinLimits(_eth)
        public
    {
        // ?????tx????
        F3Ddatasets.EventReturns memory _eventData_;

        // ????ID
        uint256 _pID = pIDxAddr_[msg.sender];

        // ??????
        uint256 _affID;
        // ?????????????????????????
        if (_affCode == '' || _affCode == plyr_[_pID].name)
        {
            // ???????????
            _affID = plyr_[_pID].laff;

        // ???????
        } else {
            // ?aff Code????ID
            _affID = pIDxName_[_affCode];

            // ??affID????????
            if (_affID != plyr_[_pID].laff)
            {
                // ????????
                plyr_[_pID].laff = _affID;
            }
        }

        // ????????????
        _team = verifyTeam(_team);

        // ????
        reLoadCore(_pID, _affID, _team, _eth, _eventData_);
    }

    /**
     * @dev ??????.
     * -functionhash- 0x3ccfd60b
     */
    function withdraw()
        isActivated()
        isHuman()
        public
    {
        // ????rID
        uint256 _rID = rID_;

        // ????
        uint256 _now = now;

        // ????ID
        uint256 _pID = pIDxAddr_[msg.sender];

        // ???eth??temp var
        uint256 _eth;

        // ???????????????????
        if (_now > round_[_rID].end && round_[_rID].ended == false && round_[_rID].plyr != 0)
        {
            // ?????tx????
            F3Ddatasets.EventReturns memory _eventData_;

            // ?????????
            round_[_rID].ended = true;
            _eventData_ = endRound(_eventData_);

            // ???????
            _eth = withdrawEarnings(_pID);

            // ??
            if (_eth > 0)
                plyr_[_pID].addr.transfer(_eth);

            // ??????
            _eventData_.compressedData = _eventData_.compressedData + (_now * 1000000000000000000);
            _eventData_.compressedIDs = _eventData_.compressedIDs + _pID;

            // ?????????
            emit F3Devents.onWithdrawAndDistribute
            (
                msg.sender,
                plyr_[_pID].name,
                _eth,
                _eventData_.compressedData,
                _eventData_.compressedIDs,
                _eventData_.winnerAddr,
                _eventData_.winnerName,
                _eventData_.amountWon,
                _eventData_.newPot,
                _eventData_.P3DAmount,
                _eventData_.genAmount
            );

        // ????????
        } else {
            // ???????
            _eth = withdrawEarnings(_pID);

            // ??
            if (_eth > 0)
                plyr_[_pID].addr.transfer(_eth);

            // ????
            emit F3Devents.onWithdraw(_pID, msg.sender, plyr_[_pID].name, _eth, _now);
        }
    }

    /**
     * @dev ??????????????????????PlayerBook?????????????????????????
     * UI???????????????????????????????????
     * - ???????
     * - ????????
     * - ????????
     * - ????????????
     * - ??????1???
     * - ??????
     * - ???0x??
     * - name?????1???
     * - ?????32???
     * - ??????a-z?0-9???
     * -functionhash- 0x921dec21 (??ID????)
     * -functionhash- 0x3ddd4698 (?????????)
     * -functionhash- 0x685ffd83 (?????????)
     * @param _nameString ???????
     * @param _affCode ??ID????????????
     * @param _all ????????????????????true
     * (??????????)
     */
    function registerNameXID(string _nameString, uint256 _affCode, bool _all)
        isHuman()
        public
        payable
    {
        bytes32 _name = _nameString.nameFilter();
        address _addr = msg.sender;
        uint256 _paid = msg.value;
        (bool _isNewPlayer, uint256 _affID) = PlayerBook.registerNameXIDFromDapp.value(_paid)(_addr, _name, _affCode, _all);

        uint256 _pID = pIDxAddr_[_addr];

        // ????
        emit F3Devents.onNewName(_pID, _addr, _name, _isNewPlayer, _affID, plyr_[_affID].addr, plyr_[_affID].name, _paid, now);
    }

    function registerNameXaddr(string _nameString, address _affCode, bool _all)
        isHuman()
        public
        payable
    {
        bytes32 _name = _nameString.nameFilter();
        address _addr = msg.sender;
        uint256 _paid = msg.value;
        (bool _isNewPlayer, uint256 _affID) = PlayerBook.registerNameXaddrFromDapp.value(msg.value)(msg.sender, _name, _affCode, _all);

        uint256 _pID = pIDxAddr_[_addr];

        // ????
        emit F3Devents.onNewName(_pID, _addr, _name, _isNewPlayer, _affID, plyr_[_affID].addr, plyr_[_affID].name, _paid, now);
    }

    function registerNameXname(string _nameString, bytes32 _affCode, bool _all)
        isHuman()
        public
        payable
    {
        bytes32 _name = _nameString.nameFilter();
        address _addr = msg.sender;
        uint256 _paid = msg.value;
        (bool _isNewPlayer, uint256 _affID) = PlayerBook.registerNameXnameFromDapp.value(msg.value)(msg.sender, _name, _affCode, _all);

        uint256 _pID = pIDxAddr_[_addr];

        // ????
        emit F3Devents.onNewName(_pID, _addr, _name, _isNewPlayer, _affID, plyr_[_affID].addr, plyr_[_affID].name, _paid, now);
    }
//==============================================================================
//     _  _ _|__|_ _  _ _  .
//    (_|(/_ |  | (/_| _\  . (??UI???etherscan????)
//=====_|=======================================================================
    /**
     * @dev ????????????????.
     * -functionhash- 0x018a25e8
     * @return ????????????wei???
     */
    function getBuyPrice()
        public
        view
        returns(uint256)
    {
        // ????rID
        uint256 _rID = rID_;

        // ????
        uint256 _now = now;

        // ????????
        if (_now > round_[_rID].strt + rndGap_ && (_now <= round_[_rID].end || (_now > round_[_rID].end && round_[_rID].plyr == 0)))
            return ( (round_[_rID].keys.add(1000000000000000000)).ethRec(1000000000000000000) );
        else // rounds over.  need price for new round
            return ( 75000000000000 ); // init
    }

    /**
     * @dev ????????????????????????????????
     * -functionhash- 0xc7e284b8
     * @return ???????
     */
    function getTimeLeft()
        public
        view
        returns(uint256)
    {
        // ????rID
        uint256 _rID = rID_;

        // ????
        uint256 _now = now;

        if (_now < round_[_rID].end)
            if (_now > round_[_rID].strt + rndGap_)
                return( (round_[_rID].end).sub(_now) );
            else
                return( (round_[_rID].strt + rndGap_).sub(_now) );
        else
            return(0);
    }

    /**
     * @dev ??????????
     * -functionhash- 0x63066434
     * @return ????
     * @return ????
     * @return ?????
     */
    function getPlayerVaults(uint256 _pID)
        public
        view
        returns(uint256 ,uint256, uint256)
    {
        // ????rID
        uint256 _rID = rID_;

        // ???????????????????????????
        if (now > round_[_rID].end && round_[_rID].ended == false && round_[_rID].plyr != 0)
        {
            // ????????
            if (round_[_rID].plyr == _pID)
            {
                return
                (
                    (plyr_[_pID].win).add( ((round_[_rID].pot).mul(25)) / 100 ),
                    (plyr_[_pID].gen).add(  getPlayerVaultsHelper(_pID, _rID).sub(plyrRnds_[_pID][_rID].mask)   ),
                    plyr_[_pID].aff
                );
            // ????????
            } else {
                return
                (
                    plyr_[_pID].win,
                    (plyr_[_pID].gen).add(  getPlayerVaultsHelper(_pID, _rID).sub(plyrRnds_[_pID][_rID].mask)  ),
                    plyr_[_pID].aff
                );
            }

        // ??????????????????????????
        } else {
            return
            (
                plyr_[_pID].win,
                (plyr_[_pID].gen).add(calcUnMaskedEarnings(_pID, plyr_[_pID].lrnd)),
                plyr_[_pID].aff
            );
        }
    }

    /**
     * ????????????????????
     */
    function getPlayerVaultsHelper(uint256 _pID, uint256 _rID)
        private
        view
        returns(uint256)
    {
        return(  ((((round_[_rID].mask).add(((((round_[_rID].pot).mul(potSplit_[round_[_rID].team].gen)) / 100).mul(1000000000000000000)) / (round_[_rID].keys))).mul(plyrRnds_[_pID][_rID].keys)) / 1000000000000000000)  );
    }

    /**
     * @dev ???????????????
     * -functionhash- 0x747dff42
     * @return ?ICO?????eth
     * @return ????
     * @return ?????
     * @return ????
     * @return ?????
     * @return ????
     * @return ???????ID???ID
     * @return ?????????
     * @return ??????????
     * @return ??????
     * @return b?????
     * @return ????????
     * @return ???????
     * @return ???????airdrop pot
     */
    function getCurrentRoundInfo()
        public
        view
        returns(uint256, uint256, uint256, uint256, uint256, uint256, uint256, address, bytes32, uint256, uint256, uint256, uint256, uint256)
    {
        // ????rID
        uint256 _rID = rID_;

        return
        (
            round_[_rID].ico,               //0
            _rID,                           //1
            round_[_rID].keys,              //2
            round_[_rID].end,               //3
            round_[_rID].strt,              //4
            round_[_rID].pot,               //5
            (round_[_rID].team + (round_[_rID].plyr * 10)),     //6
            plyr_[round_[_rID].plyr].addr,  //7
            plyr_[round_[_rID].plyr].name,  //8
            rndTmEth_[_rID][0],             //9
            rndTmEth_[_rID][1],             //10
            rndTmEth_[_rID][2],             //11
            rndTmEth_[_rID][3],             //12
            airDropTracker_ + (airDropPot_ * 1000)              //13
        );
    }

    /**
     * @dev ??????????????????????
     * use msg.sender
     * -functionhash- 0xee0b5d8b
     * @param _addr ???????????
     * @return ??ID
     * @return ?????
     * @return ??????????
     * @return ????
     * @return ????
     * @return ?????
     * @return ????eth
     */
    function getPlayerInfoByAddress(address _addr)
        public
        view
        returns(uint256, bytes32, uint256, uint256, uint256, uint256, uint256)
    {
        // ????rID
        uint256 _rID = rID_;

        if (_addr == address(0))
        {
            _addr == msg.sender;
        }
        uint256 _pID = pIDxAddr_[_addr];

        return
        (
            _pID,                               //0
            plyr_[_pID].name,                   //1
            plyrRnds_[_pID][_rID].keys,         //2
            plyr_[_pID].win,                    //3
            (plyr_[_pID].gen).add(calcUnMaskedEarnings(_pID, plyr_[_pID].lrnd)),       //4
            plyr_[_pID].aff,                    //5
            plyrRnds_[_pID][_rID].eth           //6
        );
    }

//==============================================================================
//     _ _  _ _   | _  _ . _  .
//    (_(_)| (/_  |(_)(_||(_  . (?+??+??+??=???????)
//=====================_|=======================================================
    /**
     * @dev ?????????????????????
     * ??????????????????
     */
    function buyCore(uint256 _pID, uint256 _affID, uint256 _team, F3Ddatasets.EventReturns memory _eventData_)
        private
    {
        // ????rID
        uint256 _rID = rID_;

        // ????
        uint256 _now = now;

        // ????????

        if (_now > round_[_rID].strt + rndGap_ && (_now <= round_[_rID].end || (_now > round_[_rID].end && round_[_rID].plyr == 0)))
        {
            // ????
            core(_rID, _pID, msg.value, _affID, _team, _eventData_);

        // ???????
        } else {
            // ????????????
            if (_now > round_[_rID].end && round_[_rID].ended == false)
            {
                // ???????????????
                round_[_rID].ended = true;
                _eventData_ = endRound(_eventData_);

                // ??????
                _eventData_.compressedData = _eventData_.compressedData + (_now * 1000000000000000000);
                _eventData_.compressedIDs = _eventData_.compressedIDs + _pID;

                // ???????
                emit F3Devents.onBuyAndDistribute
                (
                    msg.sender,
                    plyr_[_pID].name,
                    msg.value,
                    _eventData_.compressedData,
                    _eventData_.compressedIDs,
                    _eventData_.winnerAddr,
                    _eventData_.winnerName,
                    _eventData_.amountWon,
                    _eventData_.newPot,
                    _eventData_.P3DAmount,
                    _eventData_.genAmount
                );
            }

            // ?eth????????
            plyr_[_pID].gen = plyr_[_pID].gen.add(msg.value);
        }
    }

    /**
     * @dev ?????????????????????????
     * ??????????????????
     */
    function reLoadCore(uint256 _pID, uint256 _affID, uint256 _team, uint256 _eth, F3Ddatasets.EventReturns memory _eventData_)
        private
    {
        // ????rID
        uint256 _rID = rID_;

        // ????
        uint256 _now = now;

        // ????????
        if (_now > round_[_rID].strt + rndGap_ && (_now <= round_[_rID].end || (_now > round_[_rID].end && round_[_rID].plyr == 0)))
        {
            // ?????????????????????gen???
            // ?????????safemath???????????
            // ???????????
            plyr_[_pID].gen = withdrawEarnings(_pID).sub(_eth);

            // ????
            core(_rID, _pID, _eth, _affID, _team, _eventData_);

        // ??round?????????end round
        } else if (_now > round_[_rID].end && round_[_rID].ended == false) {
            // end the round (distributes pot) & start new round
            round_[_rID].ended = true;
            _eventData_ = endRound(_eventData_);

            // ??????
            _eventData_.compressedData = _eventData_.compressedData + (_now * 1000000000000000000);
            _eventData_.compressedIDs = _eventData_.compressedIDs + _pID;

            // ???????
            emit F3Devents.onReLoadAndDistribute
            (
                msg.sender,
                plyr_[_pID].name,
                _eventData_.compressedData,
                _eventData_.compressedIDs,
                _eventData_.winnerAddr,
                _eventData_.winnerName,
                _eventData_.amountWon,
                _eventData_.newPot,
                _eventData_.P3DAmount,
                _eventData_.genAmount
            );
        }
    }

    /**
     * @dev ????????????????/?????????
     */
    function core(uint256 _rID, uint256 _pID, uint256 _eth, uint256 _affID, uint256 _team, F3Ddatasets.EventReturns memory _eventData_)
        private
    {
        // ???????
        if (plyrRnds_[_pID][_rID].keys == 0)
            _eventData_ = managePlayer(_pID, _eventData_);

        // ????????
        if (round_[_rID].eth < 100000000000000000000 && plyrRnds_[_pID][_rID].eth.add(_eth) > 1000000000000000000)
        {
            uint256 _availableLimit = (1000000000000000000).sub(plyrRnds_[_pID][_rID].eth);
            uint256 _refund = _eth.sub(_availableLimit);
            plyr_[_pID].gen = plyr_[_pID].gen.add(_refund);
            _eth = _availableLimit;
        }

        // ?????eth??min eth????????????
        if (_eth > 1000000000)
        {

            // ?????
            uint256 _keys = (round_[_rID].eth).keysRec(_eth);

            // ????????????
            if (_keys >= 1000000000000000000)
            {
            updateTimer(_keys, _rID);

            // ???????
            if (round_[_rID].plyr != _pID)
                round_[_rID].plyr = _pID;
            if (round_[_rID].team != _team)
                round_[_rID].team = _team;

            // ???????????
            _eventData_.compressedData = _eventData_.compressedData + 100;
        }


            // ???????????????????????
            _eventData_.compressedData = _eventData_.compressedData + (airDropTracker_ * 1000);

            // ?????
            plyrRnds_[_pID][_rID].keys = _keys.add(plyrRnds_[_pID][_rID].keys);
            plyrRnds_[_pID][_rID].eth = _eth.add(plyrRnds_[_pID][_rID].eth);

            // ????
            round_[_rID].keys = _keys.add(round_[_rID].keys);
            round_[_rID].eth = _eth.add(round_[_rID].eth);
            rndTmEth_[_rID][_team] = _eth.add(rndTmEth_[_rID][_team]);

            // ????
            _eventData_ = distributeExternal(_rID, _eth, _team, _eventData_);
            _eventData_ = distributeInternal(_rID, _pID, _eth, _affID, _team, _keys, _eventData_);

            // ??end tx???????tx???
            endTx(_pID, _team, _eth, _keys, _eventData_);
        }
    }
//==============================================================================
//     _ _ | _   | _ _|_ _  _ _  .
//    (_(_||(_|_||(_| | (_)| _\  .
//==============================================================================
    /**
     * @dev ???????????????????k)
     * @return earnings in wei format
     */
    function calcUnMaskedEarnings(uint256 _pID, uint256 _rIDlast)
        private
        view
        returns(uint256)
    {
        return(  (((round_[_rIDlast].mask).mul(plyrRnds_[_pID][_rIDlast].keys)) / (1000000000000000000)).sub(plyrRnds_[_pID][_rIDlast].mask)  );
    }

    /**
     * @dev ????????eth?????.
     * -functionhash- 0xce89c80c
     * @param _rID round ID you want price for
     * @param _eth amount of eth sent in
     * @return keys received
     */
    function calcKeysReceived(uint256 _rID, uint256 _eth)
        public
        view
        returns(uint256)
    {
        // ????
        uint256 _now = now;

        // ????????
        if (_now > round_[_rID].strt + rndGap_ && (_now <= round_[_rID].end || (_now > round_[_rID].end && round_[_rID].plyr == 0)))
            return ( (round_[_rID].eth).keysRec(_eth) );
        else // ????????????
            return ( (_eth).keys() );
    }

    /**
     * @dev ??X????eth???
     * -functionhash- 0xcf808000
     * @param _keys ??????18???????
     * @return ?????eth??
     */
    function iWantXKeys(uint256 _keys)
        public
        view
        returns(uint256)
    {
        // ????rID
        uint256 _rID = rID_;

        // ????
        uint256 _now = now;

        // ????????
        if (_now > round_[_rID].strt + rndGap_ && (_now <= round_[_rID].end || (_now > round_[_rID].end && round_[_rID].plyr == 0)))
            return ( (round_[_rID].keys.add(_keys)).ethRec(_keys) );
        else // rounds over.  need price for new round
            return ( (_keys).eth() );
    }
//==============================================================================
//    _|_ _  _ | _  .
//     | (_)(_)|_\  .
//==============================================================================
    /**
     * @dev ??????????/????
     */
    function receivePlayerInfo(uint256 _pID, address _addr, bytes32 _name, uint256 _laff)
        external
    {
        require (msg.sender == address(PlayerBook), "your not playerNames contract... hmmm..");
        if (pIDxAddr_[_addr] != _pID)
            pIDxAddr_[_addr] = _pID;
        if (pIDxName_[_name] != _pID)
            pIDxName_[_name] = _pID;
        if (plyr_[_pID].addr != _addr)
            plyr_[_pID].addr = _addr;
        if (plyr_[_pID].name != _name)
            plyr_[_pID].name = _name;
        if (plyr_[_pID].laff != _laff)
            plyr_[_pID].laff = _laff;
        if (plyrNames_[_pID][_name] == false)
            plyrNames_[_pID][_name] = true;
    }

    /**
     * @dev ????????
     */
    function receivePlayerNameList(uint256 _pID, bytes32 _name)
        external
    {
        require (msg.sender == address(PlayerBook), "your not playerNames contract... hmmm..");
        if(plyrNames_[_pID][_name] == false)
            plyrNames_[_pID][_name] = true;
    }

    /**
     * @dev ?????????pID???????????????
     * @return pID
     */
    function determinePID(F3Ddatasets.EventReturns memory _eventData_)
        private
        returns (F3Ddatasets.EventReturns)
    {
        uint256 _pID = pIDxAddr_[msg.sender];
        // ??????????worldfomo???
        if (_pID == 0)
        {
            // ???????????????ID???????????
            _pID = PlayerBook.getPlayerID(msg.sender);
            bytes32 _name = PlayerBook.getPlayerName(_pID);
            uint256 _laff = PlayerBook.getPlayerLAff(_pID);

            // ??????
            pIDxAddr_[msg.sender] = _pID;
            plyr_[_pID].addr = msg.sender;

            if (_name != "")
            {
                pIDxName_[_name] = _pID;
                plyr_[_pID].name = _name;
                plyrNames_[_pID][_name] = true;
            }

            if (_laff != 0 && _laff != _pID)
                plyr_[_pID].laff = _laff;

            // ????bool???true
            _eventData_.compressedData = _eventData_.compressedData + 1;
        }
        return (_eventData_);
    }

    /**
     * @dev ??????????????????????????
     * ??????
     */
    function verifyTeam(uint256 _team)
        private
        pure
        returns (uint256)
    {
        if (_team < 0 || _team > 3)
            return(2);
        else
            return(_team);
    }

    /**
     * @dev ??????????????????????
     * ??????????????????
     */
    function managePlayer(uint256 _pID, F3Ddatasets.EventReturns memory _eventData_)
        private
        returns (F3Ddatasets.EventReturns)
    {
        // ????????????????????????
        // ??????????
        if (plyr_[_pID].lrnd != 0)
            updateGenVault(_pID, plyr_[_pID].lrnd);

        // ???????????
        plyr_[_pID].lrnd = rID_;

        // ??????bool???true
        _eventData_.compressedData = _eventData_.compressedData + 10;

        return(_eventData_);
    }

    /**
     * @dev ????????????/???
     */
    function endRound(F3Ddatasets.EventReturns memory _eventData_)
        private
        returns (F3Ddatasets.EventReturns)
    {
        // ????rID
        uint256 _rID = rID_;

        // ????????????ID
        uint256 _winPID = round_[_rID].plyr;
        uint256 _winTID = round_[_rID].team;

        // ???????
        uint256 _pot = round_[_rID].pot;

        // ????????????????????
        // ????????????????
        uint256 _win = (_pot.mul(25)) / 100;
        uint256 _com = (_pot.mul(3)) / 100;
        uint256 _gen = (_pot.mul(potSplit_[_winTID].gen)) / 100;
        uint256 _p3d = (_pot.mul(potSplit_[_winTID].p3d)) / 100;
        uint256 _res = (((_pot.sub(_win)).sub(_com)).sub(_gen)).sub(_p3d);

        // k???????ppt
        uint256 _ppt = (_gen.mul(1000000000000000000)) / (round_[_rID].keys);
        uint256 _dust = _gen.sub((_ppt.mul(round_[_rID].keys)) / 1000000000000000000);
        if (_dust > 0)
        {
            _gen = _gen.sub(_dust);
            _res = _res.add(_dust);
        }

        // ???????
        plyr_[_winPID].win = _win.add(plyr_[_winPID].win);

        // ????

        admin.transfer(_com);

        // ?gen??????????
        round_[_rID].mask = _ppt.add(round_[_rID].mask);

        // ??????
        _eventData_.compressedData = _eventData_.compressedData + (round_[_rID].end * 1000000);
        _eventData_.compressedIDs = _eventData_.compressedIDs + (_winPID * 100000000000000000000000000) + (_winTID * 100000000000000000);
        _eventData_.winnerAddr = plyr_[_winPID].addr;
        _eventData_.winnerName = plyr_[_winPID].name;
        _eventData_.amountWon = _win;
        _eventData_.genAmount = _gen;
        _eventData_.P3DAmount = _p3d;
        _eventData_.newPot = _res;

        // ?????
        rID_++;
        _rID++;
        round_[_rID].strt = now;
        round_[_rID].end = now.add(rndInit_).add(rndGap_);
        round_[_rID].pot = _res;

        return(_eventData_);
    }

    /**
     * @dev moves any unmasked earnings to gen vault.  updates earnings mask
     */
    function updateGenVault(uint256 _pID, uint256 _rIDlast)
        private
    {
        uint256 _earnings = calcUnMaskedEarnings(_pID, _rIDlast);
        if (_earnings > 0)
        {
            // ??gen?
            plyr_[_pID].gen = _earnings.add(plyr_[_pID].gen);
            // ???????????
            plyrRnds_[_pID][_rIDlast].mask = _earnings.add(plyrRnds_[_pID][_rIDlast].mask);
        }
    }

    /**
     * @dev ???????????????????
     */
    function updateTimer(uint256 _keys, uint256 _rID)
        private
    {
        // ????
        uint256 _now = now;

        // ????????????
        uint256 _newTime;
        if (_now > round_[_rID].end && round_[_rID].plyr == 0)
            _newTime = (((_keys) / (1000000000000000000)).mul(rndInc_)).add(_now);
        else
            _newTime = (((_keys) / (1000000000000000000)).mul(rndInc_)).add(round_[_rID].end);

        // ??max?????????
        if (_newTime < (rndMax_).add(_now))
            round_[_rID].end = _newTime;
        else
            round_[_rID].end = rndMax_.add(_now);
    }

    /**
     * @dev ??0-99?????????????
     * ??????
     * @return ??????????????
     */
    function airdrop()
        private
        view
        returns(bool)
    {
        uint256 seed = uint256(keccak256(abi.encodePacked(

            (block.timestamp).add
            (block.difficulty).add
            ((uint256(keccak256(abi.encodePacked(block.coinbase)))) / (now)).add
            (block.gaslimit).add
            ((uint256(keccak256(abi.encodePacked(msg.sender)))) / (now)).add
            (block.number)

        )));
        if((seed - ((seed / 1000) * 1000)) < airDropTracker_)
            return(true);
        else
            return(false);
    }

    /**
     * @dev ???com?aff?p3d?????eth
     */
    function distributeExternal(uint256 _rID, uint256 _eth, uint256 _team, F3Ddatasets.EventReturns memory _eventData_)
        private
        returns(F3Ddatasets.EventReturns)
    {
        // ??3??????
        uint256 _com = (_eth.mul(3)) / 100;
        uint256 _p3d;
        if (!address(admin).call.value(_com)())
        {
            _p3d = _com;
            _com = 0;
        }


        // ??p3d
        _p3d = _p3d.add((_eth.mul(fees_[_team].p3d)) / (100));
        if (_p3d > 0)
        {
            round_[_rID].pot = round_[_rID].pot.add(_p3d);

            // ??????
            _eventData_.P3DAmount = _p3d.add(_eventData_.P3DAmount);
        }

        return(_eventData_);
    }

    function potSwap()
        external
        payable
    {
        // ????rID
        uint256 _rID = rID_ + 1;

        round_[_rID].pot = round_[_rID].pot.add(msg.value);
        emit F3Devents.onPotSwapDeposit(_rID, msg.value);
    }

    /**
     * @dev ???gen?pot?????eth
     */
    function distributeInternal(uint256 _rID, uint256 _pID, uint256 _eth, uint256 _affID, uint256 _team, uint256 _keys, F3Ddatasets.EventReturns memory _eventData_)
        private
        returns(F3Ddatasets.EventReturns)
    {
        // ??gen??
        uint256 _gen = (_eth.mul(fees_[_team].gen)) / 100;

        // distribute share to affiliate 15%
        uint256 _aff = (_eth.mul(15)) / 100;

        // ?????? (eth = eth - (com share + pot swap share + aff share))
        _eth = _eth.sub(((_eth.mul(18)) / 100).add((_eth.mul(fees_[_team].p3d)) / 100));

        // ???
        uint256 _pot = _eth.sub(_gen);

        // decide what to do with affiliate share of fees
        // affiliate must not be self, and must have a name registered
        if (_affID != _pID && plyr_[_affID].name != '') {
            plyr_[_affID].aff = _aff.add(plyr_[_affID].aff);
            emit F3Devents.onAffiliatePayout(_affID, plyr_[_affID].addr, plyr_[_affID].name, _rID, _pID, _aff, now);
        } else {
            _gen = _gen.add(_aff);
        }

        // ??gen??????updateMasks???????????
        // ?????
        uint256 _dust = updateMasks(_rID, _pID, _gen, _keys);
        if (_dust > 0)
            _gen = _gen.sub(_dust);

        // ??eth?pot
        round_[_rID].pot = _pot.add(_dust).add(round_[_rID].pot);

        // ??????
        _eventData_.genAmount = _gen.add(_eventData_.genAmount);
        _eventData_.potAmount = _pot;

        return(_eventData_);
    }

    /**
     * @dev ???????????????
     * @return ??????
     */
    function updateMasks(uint256 _rID, uint256 _pID, uint256 _gen, uint256 _keys)
        private
        returns(uint256)
    {
        /* ????
            ??????????????????
            ???????????????????
            ???????????????
            ?????????

            ???????????????“??
            ??????????????????????
            ????????“
        */

        // ??????????????????:(??????
        uint256 _ppt = (_gen.mul(1000000000000000000)) / (round_[_rID].keys);
        round_[_rID].mask = _ppt.add(round_[_rID].mask);

        // ????????????????????
        // ????????????????
        uint256 _pearn = (_ppt.mul(_keys)) / (1000000000000000000);
        plyrRnds_[_pID][_rID].mask = (((round_[_rID].mask.mul(_keys)) / (1000000000000000000)).sub(_pearn)).add(plyrRnds_[_pID][_rID].mask);

        // ???????
        return(_gen.sub((_ppt.mul(round_[_rID].keys)) / (1000000000000000000)));
    }

    /**
     * @dev ??????????????????????0
     * @return wei?????
     */
    function withdrawEarnings(uint256 _pID)
        private
        returns(uint256)
    {
        // ??gen???
        updateGenVault(_pID, plyr_[_pID].lrnd);

        // ????
        uint256 _earnings = (plyr_[_pID].win).add(plyr_[_pID].gen).add(plyr_[_pID].aff);
        if (_earnings > 0)
        {
            plyr_[_pID].win = 0;
            plyr_[_pID].gen = 0;
            plyr_[_pID].aff = 0;
        }

        return(_earnings);
    }

    /**
     * @dev ?????????????????????tx
     */
    function endTx(uint256 _pID, uint256 _team, uint256 _eth, uint256 _keys, F3Ddatasets.EventReturns memory _eventData_)
        private
    {
        _eventData_.compressedData = _eventData_.compressedData + (now * 1000000000000000000) + (_team * 100000000000000000000000000000);
        _eventData_.compressedIDs = _eventData_.compressedIDs + _pID + (rID_ * 10000000000000000000000000000000000000000000000000000);

        emit F3Devents.onEndTx
        (
            _eventData_.compressedData,
            _eventData_.compressedIDs,
            plyr_[_pID].name,
            msg.sender,
            _eth,
            _keys,
            _eventData_.winnerAddr,
            _eventData_.winnerName,
            _eventData_.amountWon,
            _eventData_.newPot,
            _eventData_.P3DAmount,
            _eventData_.genAmount,
            _eventData_.potAmount,
            airDropPot_
        );
    }
//==============================================================================
//    (~ _  _    _._|_    .
//    _)(/_(_|_|| | | \/  .
//====================/=========================================================
    /** ????????????????
     * ????????????????????
     * ?????????                           **/
    bool public activated_ = false;
    function activate()
        public
    {
        // ????????
        require(msg.sender == admin, "only admin can activate");


        // ?????
        require(activated_ == false, "FOMO Free already activated");

        // ????
        activated_ = true;

        // ????????
        rID_ = 1;
            round_[1].strt = now + rndExtra_ - rndGap_;
            round_[1].end = now + rndInit_ + rndExtra_;
    }
}

//==============================================================================
//   __|_ _    __|_ _  .
//  _\ | | |_|(_ | _\  .
//==============================================================================
library F3Ddatasets {
    //??????
    // [76-33][32][31][30][29][28-18][17][16-6][5-3][2][1][0]
        // 0 - new player (bool)
        // 1 - joined round (bool)
        // 2 - new  leader (bool)
        // 3-5 - air drop tracker (uint 0-999)
        // 6-16 - round end time
        // 17 - winnerTeam
        // 18 - 28 timestamp
        // 29 - team
        // 30 - 0 = reinvest (round), 1 = buy (round), 2 = buy (ico), 3 = reinvest (ico)
        // 31 - airdrop happened bool
        // 32 - airdrop tier
        // 33 - airdrop amount won
    //???ID??
    // [77-52][51-26][25-0]
        // 0-25 - pID
        // 26-51 - winPID
        // 52-77 - rID
    struct EventReturns {
        uint256 compressedData;
        uint256 compressedIDs;
        address winnerAddr;         // ?????
        bytes32 winnerName;         // ?????
        uint256 amountWon;          // ????
        uint256 newPot;             // ???????
        uint256 P3DAmount;          // ?????p3d
        uint256 genAmount;          // ?????gen
        uint256 potAmount;          // ??????
    }
    struct Player {
        address addr;   // ????
        bytes32 name;   // ?????
        uint256 win;    // ????
        uint256 gen;    // ????
        uint256 aff;    // ?????
        uint256 lrnd;   // ?????
        uint256 laff;   // ?????????ID
    }
    struct PlayerRounds {
        uint256 eth;    // ?????????eth????
        uint256 keys;   // ??
        uint256 mask;   // ?????
        uint256 ico;    // ICO????
    }
    struct Round {
        uint256 plyr;   // ??????pID
        uint256 team;   // ?????tID
        uint256 end;    // ????/??
        bool ended;     // ?????????
        uint256 strt;   // ?????
        uint256 keys;   // ??
        uint256 eth;    // ???
        uint256 pot;    // ?????????/??????????????????
        uint256 mask;   // ????
        uint256 ico;    // ?ICO??????eth
        uint256 icoGen; // ICO???gen eth??
        uint256 icoAvg; // ICO?????????
    }
    struct TeamFee {
        uint256 gen;    // ????????????????
        uint256 p3d;    // ???p3d?????????
    }
    struct PotSplit {
        uint256 gen;    // ????????????????
        uint256 p3d;    // ??p3d?????????
    }
}

//==============================================================================
//  |  _      _ _ | _  .
//  |<(/_\/  (_(_||(_  .
//=======/======================================================================
library F3DKeysCalcShort {
    using SafeMath for *;
    /**
     * @dev ????X eth???????
     * @param _curEth ??????eth??
     * @param _newEth eth????
     * @return ???????
     */
    function keysRec(uint256 _curEth, uint256 _newEth)
        internal
        pure
        returns (uint256)
    {
        return(keys((_curEth).add(_newEth)).sub(keys(_curEth)));
    }

    /**
     * @dev ????X?????eth??
     * @param _curKeys ?????????
     * @param _sellKeys ??????????
     * @return ???eth??
     */
    function ethRec(uint256 _curKeys, uint256 _sellKeys)
        internal
        pure
        returns (uint256)
    {
        return((eth(_curKeys)).sub(eth(_curKeys.sub(_sellKeys))));
    }

    /**
     * @dev ?????????eth????????
     * @param _eth ??????
     * @return ???????
     */
    function keys(uint256 _eth)
        internal
        pure
        returns(uint256)
    {
        return ((((((_eth).mul(1000000000000000000)).mul(312500000000000000000000000)).add(5624988281256103515625000000000000000000000000000000000000000000)).sqrt()).sub(74999921875000000000000000000000)) / (156250000);
    }

    /**
     * @dev ?????????????????eth??
     * @param _keys “??”????
     * @return ?????
     */
    function eth(uint256 _keys)
        internal
        pure
        returns(uint256)
    {
        return ((78125000).mul(_keys.sq()).add(((149999843750000).mul(_keys.mul(1000000000000000000))) / (2))) / ((1000000000000000000).sq());
    }
}

//==============================================================================
//  . _ _|_ _  _ |` _  _ _  _  .
//  || | | (/_| ~|~(_|(_(/__\  .
//==============================================================================

interface PlayerBookInterface {
    function getPlayerID(address _addr) external returns (uint256);
    function getPlayerName(uint256 _pID) external view returns (bytes32);
    function getPlayerLAff(uint256 _pID) external view returns (uint256);
    function getPlayerAddr(uint256 _pID) external view returns (address);
    function getNameFee() external view returns (uint256);
    function registerNameXIDFromDapp(address _addr, bytes32 _name, uint256 _affCode, bool _all) external payable returns(bool, uint256);
    function registerNameXaddrFromDapp(address _addr, bytes32 _name, address _affCode, bool _all) external payable returns(bool, uint256);
    function registerNameXnameFromDapp(address _addr, bytes32 _name, bytes32 _affCode, bool _all) external payable returns(bool, uint256);
}


library NameFilter {
    /**
     * @dev ???????
     * -????????.
     * -?????????/??
     * -?????????????
     * -??????
     * -???0x??
     * -??????A-Z?a-z?0-9????
     * @return ???32??????????
     */
    function nameFilter(string _input)
        internal
        pure
        returns(bytes32)
    {
        bytes memory _temp = bytes(_input);
        uint256 _length = _temp.length;

        //?????32???
        require (_length <= 32 && _length > 0, "string must be between 1 and 32 characters");
        // ???????????????
        require(_temp[0] != 0x20 && _temp[_length-1] != 0x20, "string cannot start or end with space");
        // ?????????0x
        if (_temp[0] == 0x30)
        {
            require(_temp[1] != 0x78, "string cannot start with 0x");
            require(_temp[1] != 0x58, "string cannot start with 0X");
        }

        // ????bool?????????????
        bool _hasNonNumber;

        // ?????
        for (uint256 i = 0; i < _length; i++)
        {
            // ??????A-Z
            if (_temp[i] > 0x40 && _temp[i] < 0x5b)
            {
                // ?????a-z
                _temp[i] = byte(uint(_temp[i]) + 32);

                // ????????
                if (_hasNonNumber == false)
                    _hasNonNumber = true;
            } else {
                require
                (
                    // ?????????
                    _temp[i] == 0x20 ||
                    // ???a-z
                    (_temp[i] > 0x60 && _temp[i] < 0x7b) ||
                    // ?0-9
                    (_temp[i] > 0x2f && _temp[i] < 0x3a),
                    "string contains invalid characters"
                );
                // ??????????
                if (_temp[i] == 0x20)
                    require( _temp[i+1] != 0x20, "string cannot contain consecutive spaces");

                // ????????????????
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
 * @title SafeMath v0.1.9
 * @dev ????????????????
 * - ?? sqrt
 * - ?? sq
 * - ?? pwr
 * - ????????????????
 * - ??div????
 */
library SafeMath {

    /**
    * @dev ?????????????
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
    * @dev ??????????????????????????
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
    * @dev ?????????????
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
     * @dev ????x????.
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
     * @dev ?????x??x
     */
    function sq(uint256 x)
        internal
        pure
        returns (uint256)
    {
        return (mul(x,x));
    }

    /**
     * @dev x?y???
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