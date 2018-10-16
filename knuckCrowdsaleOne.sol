/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract knuckCrowdsaleOne at 0xed729b839322574294133c88780e809bc56abaec
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
        price = CostOfEachKnuck * 1 wei;
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
        knuckReward.transfer(msg.sender, ((amount / price) * 1 ether));
        FundTransfer(msg.sender, amount, true);
        beneficiary.transfer(amount); 
        FundTransfer(beneficiary, amount, false);
            
       
}
    }