/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract GSEPTO at 0xbf92c30ecebae64ae5ab0361f9010d7317be3c50
*/
pragma solidity ^0.4.16;

contract GSEPTO {
    string public name = "GSEPTO";
    string public symbol = "GSEPTO";

    address private owner;//???
    uint256 public fundingGoal; //????
    uint256 public amountRaised; //????
    mapping(address => uint256) public balanceOf; //??????????map??

    event Transfer(address indexed _from, address indexed _to, uint256 _amount);//??
    event FundTransfer(address indexed _backer, uint256 _amount);//?????????
    event IncreaseFunding(uint256 indexed _increase, uint256 indexed _curFundingGoal);//?????
    bool public crowdsaleOpened = true; //???????????“?”

    /*  at initialization, setup the owner */
    function GSEPTO(uint256 _fundingGoal) public {
        owner = msg.sender;
        fundingGoal = _fundingGoal;
        balanceOf[owner] = fundingGoal;
        Transfer(0x0, owner, fundingGoal);
    }

    // allows execution by the owner only
    modifier ownerOnly {
        assert(owner == msg.sender);
        _;
    }
    // when crowdsale closed, throw exception
    modifier validCrowdsale {
        assert(crowdsaleOpened);
        _;
    }

    function record(address _to, uint256 _amount) public ownerOnly validCrowdsale returns (bool success) {
        require(_to != 0x0);
        require(balanceOf[msg.sender] >= _amount);
        require(balanceOf[_to] + _amount >= balanceOf[_to]);
        balanceOf[msg.sender] -= _amount;
        //?????????????
        balanceOf[_to] += _amount;
        //???????
        amountRaised += _amount;
        Transfer(msg.sender, _to, _amount);
        //??????????
        FundTransfer(_to, _amount);
        return true;
    }

    // increase the fundingGoal
    // ???????
    function increaseFundingGoal(uint256 _amount) public ownerOnly validCrowdsale {
        balanceOf[msg.sender] += _amount;
        fundingGoal += _amount;
        Transfer(0x0, msg.sender, _amount);
        IncreaseFunding(_amount, fundingGoal);
    }

    //close this crowdsale
    // ????
    function closeUp() public ownerOnly validCrowdsale {
        crowdsaleOpened = false;
    }

    //re open this crowdsale
    // ????
    function reopen() public ownerOnly {
        crowdsaleOpened = true;
    }
}