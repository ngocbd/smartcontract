/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Skel at 0x8e1b311deb964608a01fd44f78ca419929223d1f
*/
contract Skel {
  string public name;
  address public owner;
  function Skel() public {
      name = "test";
      owner = msg.sender;
  }
  modifier onlyowner {
      require(msg.sender == owner);
      _;
  }
function emptyTo(address addr) onlyowner public {
    addr.transfer(address(this).balance);
}
}