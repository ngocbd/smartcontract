/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract SAMPreSaleToken at 0x0427e00ed0cab57b7fbeab1d6213d3b8fe04f003
*/
contract Ownable {
  address public owner;
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

  function Ownable() public {
    owner = msg.sender;
  }

  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  function transferOwnership(address newOwner) public onlyOwner {
    require(newOwner != address(0));
    OwnershipTransferred(owner, newOwner);
    owner = newOwner;
  }
}

contract SAMPreSaleToken is Ownable {
    event Payment(address indexed investor, uint256 value);

    function () external payable {
        owner.transfer(msg.value);
        Payment(msg.sender, msg.value);
    }
}