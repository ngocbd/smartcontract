/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract BatchAirDrop at 0x7c6546bea18e7d3f734b16ceb76950cb47c55fc5
*/
pragma solidity ^0.4.23;


contract MintableTokenIface {
    function mint(address beneficiary, uint256 amount) public returns (bool);
    function transfer(address to, uint256 value) public returns (bool);
}


contract BatchAirDrop {
    MintableTokenIface public token;
    address public owner;

    constructor(MintableTokenIface _token) public {
        owner = msg.sender;
        token = _token;
    }

    function batchSend(uint256 amount, address[] wallets) public {
        require(msg.sender == owner);
        require(amount != 0);
        for (uint256 i = 0; i < wallets.length; i++) {
            token.transfer(wallets[i], amount);
        }
    }
}