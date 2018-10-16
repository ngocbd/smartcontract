/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract CrowdInvestment at 0xed04927a3849fc9db3f3341a17b7d844a6c551a8
*/
pragma solidity ^0.4.4;
// "10000000000000000", "60000000000", "4000000000000000"
// , 0.004 ETH
contract CrowdInvestment {
    uint private restAmountToInvest;
    uint private maxGasPrice;
    address private creator;
    mapping(address => uint) private perUserInvestments;
    mapping(address => uint) private additionalCaps;
    uint private limitPerInvestor;

    function CrowdInvestment(uint totalCap, uint maxGasPriceParam, uint capForEverybody) public {
        restAmountToInvest = totalCap;
        creator = msg.sender;
        maxGasPrice = maxGasPriceParam;
        limitPerInvestor = capForEverybody;
    }

    function () public payable {
        require(restAmountToInvest >= msg.value); // ????? ????? ??????????
        require(tx.gasprice <= maxGasPrice); // ????? ?? gas price
        require(getCap(msg.sender) >= msg.value); // ????? ?? ?????????
        restAmountToInvest -= msg.value; // ???????? ????? ????? ??????????
        perUserInvestments[msg.sender] += msg.value; // ??????? ?????????? ????????????
    }

    function getCap (address investor) public view returns (uint) {
        return limitPerInvestor - perUserInvestments[investor] + additionalCaps[investor];
    }

    function getTotalCap () public view returns (uint) {
        return restAmountToInvest;
    }

    function addPersonalCap (address investor, uint additionalCap) public {
        require(msg.sender == creator);
        additionalCaps[investor] += additionalCap;
    }

    function addPersonalCaps (address[] memory investors, uint additionalCap) public {
        require(msg.sender == creator);
        for (uint16 i = 0; i < investors.length; i++) {
            additionalCaps[investors[i]] += additionalCap;
        }
    }

    function withdraw () public {
        require(msg.sender == creator); // ?????? ????????? ????? ??????
        creator.transfer(this.balance); // ????????? ??? ?????? ????????? ? ?????? ???
    }
}