/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract PreSale at 0xea68d87ae3a55ba91c1a8e6488627a175be81588
*/
pragma solidity 0.4.17;

// import "./FunderSmartToken.sol";

contract PreSale {

  address private deployer;

  // for performing allowed transfer
  address private FunderSmartTokenAddress = 0x0;
  address private FundersTokenCentral = 0x0;

  // 1 eth = 150 fst
  uint256 public oneEtherIsHowMuchFST = 150;

  // uint256 public startTime = 0;
  uint256 public startTime = 1506052800; // 2017/09/22
  uint256 public endTime   = 1508731200; // 2017/10/22

  uint256 public soldTokenValue = 0;
  uint256 public preSaleHardCap = 330000000 * (10 ** 18) * 2 / 100; // presale 2% hard cap amount

  event BuyEvent (address buyer, string email, uint256 etherValue, uint256 tokenValue);

  function PreSale () public {
    deployer = msg.sender;
  }

  // PreSale Contract ???? Funder Smart Token approve ?
  function buyFunderSmartToken (string _email, string _code) payable public returns (bool) {
    require(FunderSmartTokenAddress != 0x0); // ????? token contract ??
    require(FundersTokenCentral != 0x0); // ????? fstk ????
    require(msg.value >= 1 ether); // ?????? 1 ether ? token
    require(now >= startTime && now <= endTime); // presale ????
    require(soldTokenValue <= preSaleHardCap); // ?? presale ????? fst ???? 2%

    uint256 _tokenValue = msg.value * oneEtherIsHowMuchFST;

    // 35%
    if (keccak256(_code) == 0xde7683d6497212fbd59b6a6f902a01c91a09d9a070bba7506dcc0b309b358eed) {
      _tokenValue = _tokenValue * 135 / 100;
    }

    // 30%
    if (keccak256(_code) == 0x65b236bfb931f493eb9e6f3db8d461f1f547f2f3a19e33a7aeb24c7e297c926a) {
      _tokenValue = _tokenValue * 130 / 100;
    }

    // 25%
    if (keccak256(_code) == 0x274125681e11c33f71574f123a20cfd59ed25e64d634078679014fa3a872575c) {
      _tokenValue = _tokenValue * 125 / 100;
    }

    // ? FST ? FundersTokenCentral ?? msg.sender
    if (FunderSmartTokenAddress.call(bytes4(keccak256("transferFrom(address,address,uint256)")), FundersTokenCentral, msg.sender, _tokenValue) != true) {
      revert();
    }

    BuyEvent(msg.sender, _email, msg.value, _tokenValue);

    soldTokenValue = soldTokenValue + _tokenValue;

    return true;
  }

  // ???????
  function transferOut (address _to, uint256 _etherValue) public returns (bool) {
    require(msg.sender == deployer);
    _to.transfer(_etherValue);
    return true;
  }

  // ?? FST Token Contract (FunderSmartTokenAddress)
  function setFSTAddress (address _funderSmartTokenAddress) public returns (bool) {
    require(msg.sender == deployer);
    FunderSmartTokenAddress = _funderSmartTokenAddress;
    return true;
  }

  // ?? FSTK ?? (FundersTokenCentral)
  function setFSTKCentral (address _fundersTokenCentral) public returns (bool) {
    require(msg.sender == deployer);
    FundersTokenCentral = _fundersTokenCentral;
    return true;
  }

  function () public {}

}