/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract TEMTicket at 0x6b24a17b69d60261b427e9e08837bc31230d8304
*/
pragma solidity ^0.4.18;


contract TEMTicket {
    uint256 constant public FEE = 0.015 ether;

    mapping (uint256 => address) public id2Addr;
    mapping (address => uint256) public userId;
    address public TEMWallet;
    uint256 public userAmount;
    uint256 public maxAttendees;
    uint256 public startTime;

    function TEMTicket(address _TEMWallet, uint256 _maxAttendees, uint256 _startTime) public {
        TEMWallet = _TEMWallet;
        maxAttendees = _maxAttendees;
        userAmount = 0;
        startTime = _startTime;
    }

    function () payable external {
        getTicket(msg.sender);
    }

    function getTicket (address _attendee) payable public {
        require(now >= startTime && msg.value >= FEE && userId[_attendee] == 0);
        userAmount ++;
        require(userAmount <= maxAttendees);
        userId[_attendee] = userAmount;
        id2Addr[userAmount] = _attendee;
    }

    function withdraw () public {
        TEMWallet.transfer(this.balance);
    }
}