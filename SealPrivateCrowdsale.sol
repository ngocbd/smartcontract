/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract SealPrivateCrowdsale at 0x77070dd59c298d766585de4b5ec2b4549ab28ecc
*/
pragma solidity ^0.4.16;

interface Token {
    function transfer(address _to, uint256 _value) external;
}

contract SealPrivateCrowdsale {
    
    Token public tokenReward;
    address public creator;
    address public owner = 0xD2d67e716D09dCB27F85F0ffa6661E1cd569eC7F;

    uint256 private price;

    modifier isCreator() {
        require(msg.sender == creator);
        _;
    }

    event FundTransfer(address backer, uint amount, bool isContribution);

    function SealPrivateCrowdsale() public {
        creator = msg.sender;
        price = 10000;
        tokenReward = Token(0xc2B9E65174264159677520d951E543f9235af946);
    }

    function setOwner(address _owner) isCreator public {
        owner = _owner;      
    }

    function setCreator(address _creator) isCreator public {
        creator = _creator;      
    }

    function setPrice(uint256 _price) isCreator public {
        price = _price;      
    }

    function setToken(address _token) isCreator public {
        tokenReward = Token(_token);      
    }

    function sendToken(address _to, uint256 _value) isCreator public {
        tokenReward.transfer(_to, _value);      
    }

    function kill() isCreator public {
        selfdestruct(owner);
    }

    function () payable public {
        require(msg.value > 0);
        require(now > 1517443200);
        uint256 amount = msg.value * price;
        tokenReward.transfer(msg.sender, amount);
        FundTransfer(msg.sender, amount, true);
        owner.transfer(msg.value);
    }
}