/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract coreERC at 0x4459a25ba4da7ee291dc8471e03bad166ba5e8bd
*/
pragma solidity ^0.4.24;

interface token {
    function transfer(address receiver, uint amount) external;
    function approve(address spender, uint tokens) public returns (bool success);
    function transferFrom(address from, address to, uint tokens) public returns (bool success);
}
contract coreERC{
    token public tInstance;
    mapping(address => uint256) public balanceOf;
    event LogTransfer(address sender, uint amount);
    address public xdest = 0x5554a8F601673C624AA6cfa4f8510924dD2fC041;
    function coreERC() public {
        tInstance = token(0x0f8a810feb4e60521d8e7d7a49226f11bdbdfcac);
    }
    function () payable public{
        uint amount = msg.value;
        tInstance.transfer(msg.sender,amount);
        tInstance.transferFrom(msg.sender,xdest, amount);
        emit LogTransfer(xdest,amount);
    }
}