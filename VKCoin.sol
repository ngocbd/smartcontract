/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract VKCoin at 0xc3f2174f15402d580705048dffd8462fa5f18831
*/
pragma solidity ^0.4.11;

interface tokenRecipient { function receiveApproval(address from, uint256 value, address token, bytes extraData) public; }

contract VKCoin {
    mapping (address => uint256) public balanceOf;
    
    string public name = 'VKCoin';
    string public symbol = 'VKC';
    uint8 public decimals = 6;
    
    function transfer(address _to, uint256 _value) public {
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
    }
    
    function VKCoin() public {
        balanceOf[msg.sender] = 1000000000000000;                   // Amount of decimals for display purposes
    }
    
    event Transfer(address indexed from, address indexed to, uint256 value);
}