/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract UidCheckerForTwitter at 0x8dda09a1e1cedd4da1873b65583bc5e6aec7e8c4
*/
pragma solidity ^0.4.18;

// File: contracts/UidCheckerInterface.sol

interface UidCheckerInterface {

  function isUid(
    string _uid
  )
  public
  pure returns (bool);

}

// File: contracts/UidCheckerForTwitter.sol

/**
 * @title UidCheckerForTwitter
 * @author Francesco Sullo <francesco@sullo.co>
 * @dev Checks if a uid is a Twitter uid
 */

contract UidCheckerForTwitter
is UidCheckerInterface
{

  string public fromVersion = "1.0.0";

  function isUid(
    string _uid
  )
  public
  pure
  returns (bool)
  {
    bytes memory uid = bytes(_uid);
    if (uid.length == 0 || uid.length > 20) {
      return false;
    } else {
      for (uint i = 0; i < uid.length; i++) {
        if (uid[i] < 48 || uid[i] > 57) {
          return false;
        }
      }
    }
    return true;
  }

}