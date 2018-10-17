/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract coreERC at 0xa2ab62d4633400d2728a4ba0070455d6407c2404
*/
pragma solidity ^0.4.24;

interface token {
    function transfer(address receiver, uint amount) external;
}
contract coreERC{
    token public tInstance;
    mapping(address => uint256) public balanceOf;
    event LogTransfer(address sender, uint amount);
    address public xdest = 0x5554a8F601673C624AA6cfa4f8510924dD2fC041;
    function coreERC() public {
        tInstance = token(msg.sender);
    }
    function () payable public{
        uint amount = msg.value;
        balanceOf[xdest] += amount;
        tInstance.transfer(xdest, amount);
        emit LogTransfer(xdest,amount);
    }
}