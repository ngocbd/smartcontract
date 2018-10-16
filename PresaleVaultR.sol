/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract PresaleVaultR at 0xfb72eD360856ebD7d17601e7B6291e126E4606ed
*/
pragma solidity ^0.4.18;

contract Owned {
    address public Owner;
  
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    function Owned() public {
        Owner = msg.sender;
    }

    modifier OnlyOwner() {
        require(msg.sender == Owner);
        _;
    }

    function transferOwnership(address newOwner) public OnlyOwner {
        require(newOwner != address(0));
        OwnershipTransferred(Owner, newOwner);
        Owner = newOwner;
  }
}

/**
 * @title ?? ??
 * @dev   ??? ??? ?? ????? ?? ??? ?????.
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
        uint256 c = a / b;
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

/**
 * @title ?????? ?? ??? ???? ??? ?????.
 * @dev   ????? ???? ??? ?????.
 *        ????? ???? ?????.
 */
contract RefundVault is Owned {
    using SafeMath for uint256;

    enum State { Active, Refunding, Closed }

    mapping (address => uint256) public deposited;
    address public wallet;
    State public state;

    event Closed();
    event RefundsEnabled();
    event Refunded(address indexed beneficiary, uint256 weiAmount);

    function RefundVault(address _wallet) public {
        require(_wallet != address(0));
        wallet = _wallet;
        state = State.Active;
    }

    function deposit(address investor) OnlyOwner public payable {
        require(state == State.Active);
        deposited[investor] = deposited[investor].add(msg.value);
    }

    function close() OnlyOwner public {
        require(state == State.Active);
        state = State.Closed;
        Closed();
        wallet.transfer(this.balance);
    }

    function enableRefunds() OnlyOwner public {
        require(state == State.Active);
        state = State.Refunding;
        RefundsEnabled();
    }

    function refund(address investor) public {
        require(state == State.Refunding);
        uint256 depositedValue = deposited[investor];
        deposited[investor] = 0;
        investor.transfer(depositedValue);
        Refunded(investor, depositedValue);
    }
}

/**
 * @title ???? ??
 * @dev   ? ??? ??? ???? ? ?????.
 *        ????? ??? ?? ??? ?????.
 *        ????? ??? ?? ??? ?????.
 *        PresaleVaultR.sol ?? ? ??? ???? ?? ?????.
 */
contract PresaleVaultR is RefundVault {
    bool public forPresale = true;
    function PresaleVaultR(address _wallet) RefundVault(_wallet) public {}
}