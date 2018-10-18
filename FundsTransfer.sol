/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract FundsTransfer at 0x64700caf8b763c0d6399e4b40dc56b7fb0e83faf
*/
pragma solidity ^0.4.23;

// ----------------------------------------------------------------------------
// Owned contract
// ----------------------------------------------------------------------------
contract Owned {
    address public owner;

    event OwnershipTransferred(address indexed _from, address indexed _to);

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

}

contract FundsTransfer is Owned{
    address public wallet;
    // ------------------------------------------------------------------------
    // Constructor
    // ------------------------------------------------------------------------
    constructor (address _wallet, address _owner) public{
        wallet = _wallet;
        owner = _owner;
    }

    function () external payable{
        _forwardFunds(msg.value);   
    }
  
    function _forwardFunds(uint256 _amount) internal {
        wallet.transfer(_amount);
    }
    
    function changeWallet(address newWallet) public onlyOwner {
        wallet = newWallet;
    }
}