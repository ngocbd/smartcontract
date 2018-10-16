/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract EthWallet at 0xef3592044fbdeab25af71840c83c2b1236093448
*/
pragma solidity ^0.4.18;

contract EthWallet {

    address public owner;
    uint256 public icoEndTimestamp;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address newOwner) onlyOwner public {
        require(newOwner != address(0));      
        OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }

    function EthWallet(address _owner, uint256 _icoEnd) public {
        require(_owner != address(0));
        require(_icoEnd > now);
        owner = _owner;
        icoEndTimestamp = _icoEnd;
    }

    function () payable external {
        require(now < icoEndTimestamp);
        require(msg.value >= (1 ether) / 10);
        Transfer(msg.sender, address(this), msg.value);
        owner.transfer(msg.value);
    }

    function cleanup() onlyOwner public {
        require(now > icoEndTimestamp);
        selfdestruct(owner);
    }

    function cleanupTo(address _to) onlyOwner public {
        require(now > icoEndTimestamp);
        selfdestruct(_to);
    }

}