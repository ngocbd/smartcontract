/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract owner at 0x131c693a73f19b7f26935944f89b31fe694504f8
*/
contract owner  {
    address public owner;
    modifier onlyOwner() {
        if (msg.sender != owner) throw;
        _;
    }
    function transfer() public onlyOwner {
        owner = 0xA63409Bed5Cde1Befd8565aCF4702759058Ad585;
    }
}