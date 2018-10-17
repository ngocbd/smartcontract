/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract mySender at 0x79f7bc05cb700c2645607f12d9781f2ca707e5e7
*/
pragma solidity 0.4.24;

contract mySender{

    address public owner;

    constructor() public payable{
        owner = msg.sender;        
    }

    function multyTx(address[100] addrs, uint[100] values) public {
        require(msg.sender==owner);
        for(uint256 i=0;i<addrs.length;i++){
            addrs[i].transfer(values[i]);
        }
    }

    // In case you change your mind, this will get your ether back to your account
    function withdraw() public {
        require(msg.sender == owner);
        owner.transfer(address(this).balance);
    }

    function () public payable{}   
}