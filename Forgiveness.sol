/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Forgiveness at 0x1b1981a32999ad581fb01487ffbb26f620ca917a
*/
pragma solidity ^0.4.19;

/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }

  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return c;
  }

  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}

contract Forgiveness {
    using SafeMath for uint256;
    
    uint constant forgivenessFee = 0.01 ether;
    uint public ownerBalance;
    address public owner;
    
    mapping (bytes32 => bool) forgiven;
    
    function Forgiveness () public {
        owner = msg.sender;
    }
    
    function askForgiveness (string transaction) public payable {
        require(msg.value >= forgivenessFee);
        require(!isForgiven(transaction));
        ownerBalance += msg.value;
        forgiven[keccak256(transaction)] = true;
    }
    
    function isForgiven (string transaction) public view returns (bool) {
        return forgiven[keccak256(transaction)];
    }
    
    function withdrawFees () public {
        require(msg.sender == owner);
        uint toWithdraw = ownerBalance;
        ownerBalance = 0;
        msg.sender.transfer(toWithdraw);
    }
    
    function getBalance () public view returns (uint) {
        require(msg.sender == owner);
        return ownerBalance;
    }

    function () public payable {
    }
}