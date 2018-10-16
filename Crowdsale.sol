/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Crowdsale at 0x0b38bcec2b7404490a16a9fbbd3a87e14dac0367
*/
pragma solidity ^0.4.18;

interface token {
    function transfer(address receiver, uint amount) public;
}

contract Crowdsale {
    address public owner;
    uint public tokenRaised;
    uint public deadline;
    uint public rateOfEther;
    token public tokenReward;
    mapping(address => uint256) public balanceOf;
    bool crowdsaleClosed = false;

    event FundTransfer(address backer, uint amount, bool isContribution);

    /**
     * Constrctor function
     *
     * Setup the owner
     */
    function Crowdsale(
        uint durationInMinutes,
        address addressOfTokenUsedAsReward
    ) public {
        owner = msg.sender;
        deadline = now + durationInMinutes * 1 minutes;
        rateOfEther = 42352;
        tokenReward = token(addressOfTokenUsedAsReward);
    }

function setPrice(uint tokenRateOfEachEther) public {
    if(msg.sender == owner) {
      rateOfEther = tokenRateOfEachEther;
    }
}

function changeOwner (address newOwner) public {
  if(msg.sender == owner) {
    owner = newOwner;
  }
}

function changeCrowdsale(bool isClose) public {
    if(msg.sender == owner) {
        crowdsaleClosed = isClose;
    }
}
    /**
     * Fallback function
     *
     * The function without name is the default function that is called whenever anyone sends funds to a contract
     */
    function () payable public {
        require(!crowdsaleClosed);
        require(now <= deadline);
        uint amount = msg.value;
        uint tokens = amount * rateOfEther;
        require((tokenRaised + tokens) <= 100000000 * 1 ether);
        balanceOf[msg.sender] += tokens;
        tokenRaised += tokens;
        tokenReward.transfer(msg.sender, tokens);
        FundTransfer(msg.sender, tokens, true);
        if(owner.send(amount)) {
            FundTransfer(owner, amount, false);
        }
    }
}