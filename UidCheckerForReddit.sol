/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract UidCheckerForReddit at 0xba43878e934f90bcca332499deab9b50806bfbb0
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

// File: contracts/UidCheckerForReddit.sol

/**
 * @title UidCheckerForReddit
 * @author Francesco Sullo <francesco@sullo.co>
 * @dev Checks if a uid is a Reddit uid
 */



contract UidCheckerForReddit
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
    if (uid.length < 3 || uid.length > 20) {
      return false;
    } else {
      for (uint i = 0; i < uid.length; i++) {
        if (!(
        uid[i] == 45 || uid[i] == 95
        || (uid[i] >= 48 && uid[i] <= 57)
        // it requires lowercases, to not risk conflicts
        // even if Reddit allows lower and upper cases
        || (uid[i] >= 97 && uid[i] <= 122)
        )) {
          return false;
        }
      }
    }
    return true;
  }

}