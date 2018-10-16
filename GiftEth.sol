/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract GiftEth at 0x83ee4a6a83b06f5d28eb98145d1349bb93a165c3
*/
pragma solidity ^0.4.17;

contract GiftEth {

  event RecipientChanged(address indexed _oldRecipient, address indexed _newRecipient);

  address public gifter;
  address public recipient;
  uint256 public lockTs;
  string public giftMessage;

  function GiftEth(address _gifter, address _recipient, uint256 _lockTs, string _giftMessage) payable public {
    gifter = _gifter;
    recipient = _recipient;
    lockTs = _lockTs;
    giftMessage = _giftMessage;
  }

  function withdraw() public {
    require(msg.sender == recipient);
    require(now >= lockTs);
    msg.sender.transfer(this.balance);
  }

  function changeRecipient(address _newRecipient) public {
    require(msg.sender == recipient);
    RecipientChanged(recipient, _newRecipient);
    recipient = _newRecipient;
  }

}