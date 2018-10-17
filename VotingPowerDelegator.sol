/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract VotingPowerDelegator at 0x7fc7f71da6d2d9deff5100c8f3d8e54c97697ad2
*/
pragma solidity ^0.4.24;

// Delegate voting power for stake based voting and governance.
// Enables safe in-app voting participation, by letting users
// delegate their cold wallet VP to a convenient hot wallet.
contract VotingPowerDelegator {
    // delegator => beneficiary
    mapping (address => address) public delegations;
    mapping (address => uint)    public delegatedAt;
    event Delegated(address delegator, address beneficiary);

    constructor() public { }

    function delegate(address beneficiary) public {
        if (beneficiary == msg.sender) {
            beneficiary = 0;
        }
        delegations[msg.sender] = beneficiary;
        delegatedAt[msg.sender] = now;
        emit Delegated(msg.sender, beneficiary);
    }

    function () public payable {
        revert();
    }
}