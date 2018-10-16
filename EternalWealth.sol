/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract EternalWealth at 0xD4972F69D1B827758bAec9Ac9E0604341D3370F8
*/
pragma solidity ^0.4.18;

contract EternalWealth {
    
    uint public doomsday;
    address owner;
    address public savior;
    uint public blessings = 0;
    uint public tithes = 0;
    uint public lifePoints = 0;
    
    function EternalWealth() public payable {
        owner = msg.sender;
        doomsday = now + 3 hours;
        savior = msg.sender;
        blessings += msg.value;
    }
    
    function ExtendLife() public payable {

        require(msg.value >= 0.001 ether);

        if (now > doomsday) {
            revert();
        }
    
        blessings += msg.value * 8 / 10;
        tithes += msg.value * 2 / 10;
        savior = msg.sender;
        doomsday = now + 30 minutes;
        lifePoints += 1;
    }
    

    function ClaimBlessings() public {
        require(msg.sender == savior);
        require(now > doomsday);
        uint pendingBlessings = blessings;
        blessings = 0;
        savior.transfer(pendingBlessings);
    }
    
    function WithdrawTithes() public {
        uint pendingTithes = tithes;
        tithes = 0;
        owner.transfer(pendingTithes);
    }
    
}