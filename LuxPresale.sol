/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract LuxPresale at 0xab407a06a1e77c033e1d5f21a2045789b204fd51
*/
pragma solidity ^0.4.8;
contract token { function transfer(address receiver, uint amount) returns (bool) {  } }

contract LuxPresale {
    address public beneficiary;
    uint public totalLux; uint public amountRaised; uint public deadline; uint public price; uint public presaleStartDate;
    token public tokenReward;
    mapping(address => uint) public balanceOf;
    bool fundingGoalReached = false; //?????? ?? ???? ?????
    event GoalReached(address beneficiary, uint amountRaised);
    event FundTransfer(address backer, uint amount, bool isContribution);
    bool crowdsaleClosed = false;

    /* data structure to hold information about campaign contributors */

    /*  at initialization, setup the owner */
    function LuxPresale(
        address ifSuccessfulSendTo,
        uint fundingGoalInLux,
        uint startDate,
        uint durationInMinutes,
        token addressOfTokenUsedAsReward
    ) {
        beneficiary = ifSuccessfulSendTo;
        totalLux = fundingGoalInLux * 100; // ??????? ?????? ????????
        presaleStartDate = startDate; // ???? ?????? ????????
        deadline = startDate + durationInMinutes * 1 minutes;
        tokenReward = token(addressOfTokenUsedAsReward);
    }
    
    /* The function without name is the default function that is called whenever anyone sends funds to a contract */
    
    function () payable {
        if (now < presaleStartDate) throw; // A participant cannot send funds before the presale start date

        if (crowdsaleClosed) { // ??????????? ?????? 
			if (msg.value > 0) throw; // ???? ????? ???????? ??????????? ?????
            uint reward = balanceOf[msg.sender];
            balanceOf[msg.sender] = 0;
            if (reward > 0) {
                if (!tokenReward.transfer(msg.sender, reward/price)) {
                    balanceOf[msg.sender] = reward;
                }
            }        
        } else { // ????????? ?????? ? ??? ??? ??????? ????????
            uint amount = msg.value; // ??????? ?????????? ???????
            balanceOf[msg.sender] += amount; // ????????? ??????
            amountRaised += amount; // ??????????? ????? ????????? ?????
        }
    }
    
    modifier afterDeadline() { if (now >= deadline) _; }
    
    modifier onlyOwner() {
        if (msg.sender != beneficiary) {
            throw;
        }
        _;
    }

    /* checks if the goal or time limit has been reached and ends the campaign */
    /* ????????? ???? ????? */
    function setGoalReached() afterDeadline {
        if (amountRaised == 0) throw; // ???? ?? ??????? ?????
        if (crowdsaleClosed) throw; // ??????? ?????? ??? ???????
        crowdsaleClosed = true;
        price = amountRaised/totalLux; // ???? 1 ?????
    }

    /*  */
    function safeWithdrawal() afterDeadline onlyOwner {
        if (!crowdsaleClosed) throw;
        if (beneficiary.send(amountRaised)) {
            FundTransfer(beneficiary, amountRaised, false);
        }
    }
}