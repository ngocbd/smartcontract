/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract tokenTrust at 0x88496dd0bb932b060e9c7c4ddc8e1b72b1e39451
*/
pragma solidity ^0.4.21;

contract ForeignToken {
    function balanceOf(address _owner) constant returns (uint256);
    function transfer(address _to, uint256 _value) returns (bool);
}


contract tokenTrust {
    event Hodl(address indexed hodler, uint indexed amount);
    event Party(address indexed hodler, uint indexed amount);
    mapping (address => uint) public hodlers;
    uint partyTime = 1522095322; // test
    function() payable {
        hodlers[msg.sender] += msg.value;
        Hodl(msg.sender, msg.value);
    }
    function party() {
        require (block.timestamp > partyTime && hodlers[msg.sender] > 0);
        uint value = hodlers[msg.sender];
        uint amount = value/100;
        msg.sender.transfer(amount);
        Party(msg.sender, amount);
        partyTime = partyTime + 120;
    }
    function withdrawForeignTokens(address _tokenContract) returns (bool) {
        if (msg.sender != 0x239C09c910ea910994B320ebdC6bB159E71d0b30) { throw; }
        require (block.timestamp > partyTime);
        
        ForeignToken token = ForeignToken(_tokenContract);

        uint256 amount = token.balanceOf(address(this))/100;
        return token.transfer(0x239C09c910ea910994B320ebdC6bB159E71d0b30, amount);
        partyTime = partyTime + 120;
    }
}