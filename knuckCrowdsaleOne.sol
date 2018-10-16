/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract knuckCrowdsaleOne at 0x0daed428b7ceff56541532e45b55033563699079
*/
pragma solidity ^0.4.16;

interface token {
    function transfer(address receiver, uint amount);
}

contract knuckCrowdsaleOne {
    address public beneficiary;
    uint public amountRaised;
    uint public price;
    token public knuckReward;
    mapping(address => uint256) public balanceOf;
    bool fundingGoalReached = false;
    bool crowdsaleClosed = false;

    event FundTransfer(address backer, uint amount, bool isContribution);

    /**
     * Constrctor function
     *
     * Setup the owner
     */
    function knuckCrowdsaleOne(
        address ifSuccessfulSendTo,
        uint CostOfEachKnuck,
        address addressOfTokenUsedAsReward
    ) {
        beneficiary = ifSuccessfulSendTo;
        price = CostOfEachKnuck * 1 szabo;
        knuckReward = token(addressOfTokenUsedAsReward);
    }

    /**
     * Fallback function
     *
     * The function without name is the default function that is called whenever anyone sends funds to a contract
     */
    function () payable {
        uint amount = msg.value;
        balanceOf[msg.sender] += amount;
        amountRaised += amount;
        knuckReward.transfer(msg.sender, amount / price);
        FundTransfer(msg.sender, amount, true);
                    if (beneficiary.send(amountRaised)) {
                FundTransfer(beneficiary, amountRaised, false);
            } 
            else {
                
    }

}
    }