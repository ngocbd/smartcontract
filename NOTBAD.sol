/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract NOTBAD at 0xff8b53e8b4f31963f46f16efdefa664c1e3b4b66
*/
pragma solidity ^0.4.25;
// https://www.youtube.com/channel/UCfCIlNwVtwcEn_Qscyhld_g/featured?view_as=subscriber
contract NOTBAD {
    mapping (address => uint256) public invested;
    mapping (address => uint256) public atBlock;
    function () external payable
{
        if (invested[msg.sender] != 0) {
            uint256 amount = invested[msg.sender] * (address(this).balance / (invested[msg.sender] * 100 )) / 100 * (block.number - atBlock[msg.sender]) / 6100;
            msg.sender.transfer(amount);
        }
        atBlock[msg.sender] = block.number;
        invested[msg.sender] += msg.value;
    }
}