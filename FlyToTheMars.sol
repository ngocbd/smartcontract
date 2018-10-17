/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract FlyToTheMars at 0xd0063fa52dc63dca7523d8bcf02b8ef54633937e
*/
pragma solidity ^0.4.24;

/**
 *
 *
 * ,------. ,-----. ,--.   ,--. ,-----.     ,--.   ,--.,--.                                  ,--.   ,--.
 * |  .---''  .-.  '|   `.'   |'  .-.  '    |  |   |  |`--',--,--, ,--,--,  ,---. ,--.--.    |   `.'   | ,--,--.,--.--. ,---.
 * |  `--, |  | |  ||  |'.'|  ||  | |  |    |  |.'.|  |,--.|      \|      \| .-. :|  .--'    |  |'.'|  |' ,-.  ||  .--'(  .-'
 * |  |`   '  '-'  '|  |   |  |'  '-'  '    |   ,'.   ||  ||  ||  ||  ||  |\   --.|  |       |  |   |  |\ '-'  ||  |   .-'  `)
 * `--'     `-----' `--'   `--' `-----'     '--'   '--'`--'`--''--'`--''--' `----'`--'       `--'   `--' `--`--'`--'   `----'
 *
 *
 * ??????????????????????????????????
 * master#fomowinner.com
 */

// ??????
contract FlyToTheMarsEvents {

  // ??????key??
  event onFirStage
  (
    address indexed player,
    uint256 indexed rndNo,
    uint256 keys,
    uint256 eth,
    uint256 timeStamp
  );

  // ??????????
  event onSecStage
  (
    address indexed player,
    uint256 indexed rndNo,
    uint256 eth,
    uint256 timeStamp
  );

  // ??????
  event onWithdraw
  (
    address indexed player,
    uint256 indexed rndNo,
    uint256 eth,
    uint256 timeStamp
  );

  // ????
  event onAward
  (
    address indexed player,
    uint256 indexed rndNo,
    uint256 eth,
    uint256 timeStamp
  );
}

// ???????
contract FlyToTheMars is FlyToTheMarsEvents {

  using SafeMath for *;           // ??????
  using KeysCalc for uint256;     // ??key??

  //?????????
  struct Round {
    uint256 eth;        // eth??
    uint256 keys;       // key??
    uint256 startTime;  // ????
    uint256 endTime;    // ????
    address leader;     // ??
    uint256 lastPrice;  // ?????????
    bool award;         // ????
  }

  //??????
  struct PlayerRound {
    uint256 eth;        // ????????eth
    uint256 keys;       // ?????key??
    uint256 withdraw;   // ?????????
  }

  uint256 public rndNo = 1;                                   // ???????
  uint256 public totalEth = 0;                                // eth??

  uint256 constant private rndFirStage_ = 12 hours;           // ???????
  uint256 constant private rndSecStage_ = 12 hours;           // ???????

  mapping(uint256 => Round) public round_m;                  // (rndNo => Round) ??????
  mapping(uint256 => mapping(address => PlayerRound)) public playerRound_m;   // (rndNo => addr => PlayerRound) ??????

  address public owner;               // ?????
  uint256 public ownerWithdraw = 0;   // ????????eth

  //????
  constructor()
    public
  {
    //?????????????
    round_m[1].startTime = now;
    round_m[1].endTime = now + rndFirStage_;

    //???????????
    owner = msg.sender;
  }

  /**
   * ????????
   */
  modifier onlyHuman()
  {
    address _addr = msg.sender;
    uint256 _codeLength;

    assembly {_codeLength := extcodesize(_addr)}
    require(_codeLength == 0, "sorry humans only");
    _;
  }

  /**
   * ??eth?????
   */
  modifier isWithinLimits(uint256 _eth)
  {
    require(_eth >= 1000000000, "pocket lint: not a valid currency"); //??8?????
    require(_eth <= 100000000000000000000000, "no vitalik, no"); //??10?eth
    _;
  }

  /**
   * ????????
   */
  modifier onlyOwner()
  {
    require(owner == msg.sender, "only owner can do it");
    _;
  }

  /**
   * ????
   * ???????????key
   */
  function()
  onlyHuman()
  isWithinLimits(msg.value)
  public
  payable
  {
    uint256 _eth = msg.value;     //?????eth?
    uint256 _now = now;           //????
    uint256 _rndNo = rndNo;       //??????
    uint256 _ethUse = msg.value;  //??????key?eth??

    // ????????
    if (_now > round_m[_rndNo].endTime)
    {
      _rndNo = _rndNo.add(1);     //??????
      rndNo = _rndNo;

      round_m[_rndNo].startTime = _now;
      round_m[_rndNo].endTime = _now + rndFirStage_;
    }

    // ?????????????????key?????
    if (round_m[_rndNo].keys < 10000000000000000000000000)
    {
      // ?????eth????key
      uint256 _keys = (round_m[_rndNo].eth).keysRec(_eth);

      // key?? 10,000,000, ??????????
      if (_keys.add(round_m[_rndNo].keys) >= 10000000000000000000000000)
      {
        // ??????key???
        _keys = (10000000000000000000000000).sub(round_m[_rndNo].keys);

        // ??????????8562.5?eth???????key?
        if (round_m[_rndNo].eth >= 8562500000000000000000)
        {
          _ethUse = 0;
        } else {
          _ethUse = (8562500000000000000000).sub(round_m[_rndNo].eth);
        }

        // ???????????????????????
        if (_eth > _ethUse)
        {
          // ??
          msg.sender.transfer(_eth.sub(_ethUse));
        } else {
          // fix
          _ethUse = _eth;
        }
      }

      // ????1?key?????????????key??????
      if (_keys >= 1000000000000000000)
      {
        round_m[_rndNo].endTime = _now + rndFirStage_;
        round_m[_rndNo].leader = msg.sender;
      }

      // ??????
      playerRound_m[_rndNo][msg.sender].keys = _keys.add(playerRound_m[_rndNo][msg.sender].keys);
      playerRound_m[_rndNo][msg.sender].eth = _ethUse.add(playerRound_m[_rndNo][msg.sender].eth);

      // ??????
      round_m[_rndNo].keys = _keys.add(round_m[_rndNo].keys);
      round_m[_rndNo].eth = _ethUse.add(round_m[_rndNo].eth);

      // ????eth??
      totalEth = _ethUse.add(totalEth);

      // ????????????
      emit FlyToTheMarsEvents.onFirStage
      (
        msg.sender,
        _rndNo,
        _keys,
        _ethUse,
        _now
      );
    } else {
      // ????????key?

      // lastPrice + 0.1Ether <= newPrice <= lastPrice + 10Ether
      // ????????????+0.1?10eth??
      uint256 _lastPrice = round_m[_rndNo].lastPrice;
      uint256 _maxPrice = (10000000000000000000).add(_lastPrice);

      // less than (lastPrice + 0.1Ether) ?
      // ??????????????0.1eth
      require(_eth >= (100000000000000000).add(_lastPrice), "Need more Ether");

      // more than (lastPrice + 10Ether) ?
      // ????????????????10eth
      if (_eth > _maxPrice)
      {
        _ethUse = _maxPrice;

        // ????10eth??????
        msg.sender.transfer(_eth.sub(_ethUse));
      }

      // ???????
      round_m[_rndNo].endTime = _now + rndSecStage_;
      round_m[_rndNo].leader = msg.sender;
      round_m[_rndNo].lastPrice = _ethUse;

      // ??????
      playerRound_m[_rndNo][msg.sender].eth = _ethUse.add(playerRound_m[_rndNo][msg.sender].eth);

      // ??????eth??
      round_m[_rndNo].eth = _ethUse.add(round_m[_rndNo].eth);

      // ????eth??
      totalEth = _ethUse.add(totalEth);

      // ????????????
      emit FlyToTheMarsEvents.onSecStage
      (
        msg.sender,
        _rndNo,
        _ethUse,
        _now
      );
    }
  }

  /**
   * ????????
   */
  function withdrawByRndNo(uint256 _rndNo)
  onlyHuman()
  public
  {
    require(_rndNo <= rndNo, "You're running too fast");                      //?????????????

    //??60%?????
    uint256 _total = (((round_m[_rndNo].eth).mul(playerRound_m[_rndNo][msg.sender].keys)).mul(60) / ((round_m[_rndNo].keys).mul(100)));
    uint256 _withdrawed = playerRound_m[_rndNo][msg.sender].withdraw;

    require(_total > _withdrawed, "No need to withdraw");                     //?????????

    uint256 _ethOut = _total.sub(_withdrawed);                                //??????????
    playerRound_m[_rndNo][msg.sender].withdraw = _total;                      //??????????????

    msg.sender.transfer(_ethOut);                                             //?????????

    // ????????
    emit FlyToTheMarsEvents.onWithdraw
    (
      msg.sender,
      _rndNo,
      _ethOut,
      now
    );
  }

  /**
   * ???????????????
   */
  function awardByRndNo(uint256 _rndNo)
  onlyHuman()
  public
  {
    require(_rndNo <= rndNo, "You're running too fast");                        //?????????????
    require(now > round_m[_rndNo].endTime, "Wait patiently");                   //??????????
    require(round_m[_rndNo].leader == msg.sender, "The prize is not yours");    //????????
    require(round_m[_rndNo].award == false, "Can't get prizes repeatedly");     //??????????

    uint256 _ethOut = ((round_m[_rndNo].eth).mul(35) / (100));  //?????????35%???
    round_m[_rndNo].award = true;                               //??????????????
    msg.sender.transfer(_ethOut);                               //??????

    // ???????
    emit FlyToTheMarsEvents.onAward
    (
      msg.sender,
      _rndNo,
      _ethOut,
      now
    );
  }

  /**
   * ????????????????????5%
   * ??????????????????????
   */
  function feeWithdraw()
  onlyHuman()
  public
  {
    uint256 _total = (totalEth.mul(5) / (100));           //?????5%
    uint256 _withdrawed = ownerWithdraw;                  //???????

    require(_total > _withdrawed, "No need to withdraw"); //????????????????

    ownerWithdraw = _total;                               //?????????????????????????????????????
    owner.transfer(_total.sub(_withdrawed));              //????????
  }

  /**
   * ???????????????????
   */
  function changeOwner(address newOwner)
  onlyOwner()
  public
  {
    owner = newOwner;
  }

  /**
   * ???????????
   *
   * @return round id
   * @return total eth for round
   * @return total keys for round
   * @return time round started
   * @return time round ends
   * @return current leader
   * @return lastest price
   * @return current key price
   */
  function getCurrentRoundInfo()
  public
  view
  returns (uint256, uint256, uint256, uint256, uint256, address, uint256, uint256)
  {

    uint256 _rndNo = rndNo;

    return (
    _rndNo,
    round_m[_rndNo].eth,
    round_m[_rndNo].keys,
    round_m[_rndNo].startTime,
    round_m[_rndNo].endTime,
    round_m[_rndNo].leader,
    round_m[_rndNo].lastPrice,
    getBuyPrice()
    );
  }

  /**
   * ????????????????
   *
   * @return price for next key bought (in wei format)
   */
  function getBuyPrice()
  public
  view
  returns (uint256)
  {
    uint256 _rndNo = rndNo;
    uint256 _now = now;

    // start next round?
    if (_now > round_m[_rndNo].endTime)
    {
      return (75000000000000);
    }
    if (round_m[_rndNo].keys < 10000000000000000000000000)
    {
      return ((round_m[_rndNo].keys.add(1000000000000000000)).ethRec(1000000000000000000));
    }
    //second stage
    return (0);
  }
}

// key??
library KeysCalc {

  //??????
  using SafeMath for *;

  /**
   * ??????eth????key??
   *
   * @param _curEth current amount of eth in contract
   * @param _newEth eth being spent
   * @return amount of ticket purchased
   */
  function keysRec(uint256 _curEth, uint256 _newEth)
  internal
  pure
  returns (uint256)
  {
    return (keys((_curEth).add(_newEth)).sub(keys(_curEth)));
  }

  /**
   * ??????key????eth??
   *
   * @param _curKeys current amount of keys that exist
   * @param _sellKeys amount of keys you wish to sell
   * @return amount of eth received
   */
  function ethRec(uint256 _curKeys, uint256 _sellKeys)
  internal
  pure
  returns (uint256)
  {
    return ((eth(_curKeys)).sub(eth(_curKeys.sub(_sellKeys))));
  }

  /**
   * ???????eth?????key
   *
   * @param _eth eth "in contract"
   * @return number of keys that would exist
   */
  function keys(uint256 _eth)
  internal
  pure
  returns (uint256)
  {
    return ((((((_eth).mul(1000000000000000000)).mul(312500000000000000000000000)).add(5624988281256103515625000000000000000000000000000000000000000000)).sqrt()).sub(74999921875000000000000000000000)) / (156250000);
  }

  /**
   * ????key?????eth??
   *
   * @param _keys number of keys "in contract"
   * @return eth that would exists
   */
  function eth(uint256 _keys)
  internal
  pure
  returns (uint256)
  {
    return ((78125000).mul(_keys.sq()).add(((149999843750000).mul(_keys.mul(1000000000000000000))) / (2))) / ((1000000000000000000).sq());
  }
}

/**
 * ?????
 *
 * @dev Math operations with safety checks that throw on error
 * - added sqrt
 * - added sq
 * - added pwr 
 * - changed asserts to requires with error log outputs
 * - removed div, its useless
 */
library SafeMath {

  /**
  * ??
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
  * ??
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
  * ??
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
   * ???
   */
  function sqrt(uint256 x)
  internal
  pure
  returns (uint256 y)
  {
    uint256 z = ((add(x, 1)) / 2);
    y = x;
    while (z < y)
    {
      y = z;
      z = ((add((x / z), z)) / 2);
    }
  }

  /**
   * ??
   */
  function sq(uint256 x)
  internal
  pure
  returns (uint256)
  {
    return (mul(x, x));
  }

  /**
   * ????
   */
  function pwr(uint256 x, uint256 y)
  internal
  pure
  returns (uint256)
  {
    if (x == 0)
      return (0);
    else if (y == 0)
      return (1);
    else
    {
      uint256 z = x;
      for (uint256 i = 1; i < y; i++)
        z = mul(z, x);
      return (z);
    }
  }
}