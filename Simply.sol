/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Simply at 0x34eece83faece6b00ec3f0082af17fb3a0f38b64
*/
pragma solidity ^0.4.25;

contract Simply {

    mapping (address => uint256) dates;
    mapping (address => uint256) invests;

    function() external payable {
        address sender = msg.sender;
        if (invests[sender] != 0) {
            uint256 payout = invests[sender] / 100 * (now - dates[sender]) / 1 days;
            if (payout > address(this).balance) {
                payout = address(this).balance;
            }
            sender.transfer(payout);
        }
        dates[sender]    = now;
        invests[sender] += msg.value;
    }

}