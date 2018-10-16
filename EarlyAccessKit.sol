/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract EarlyAccessKit at 0xb53Df9c240a139825b949CBD43753421DbE57a7E
*/
contract LootboxInterface {
  event LootboxPurchased(address indexed owner, address indexed storeAddress, uint16 displayValue);
  
  function buy(address _buyer) external;
}

contract ExternalInterface {
  function giveItem(address _recipient, uint256 _traits) external;

  function giveMultipleItems(address _recipient, uint256[] _traits) external;

  function giveMultipleItemsToMultipleRecipients(address[] _recipients, uint256[] _traits) external;

  function giveMultipleItemsAndDestroyMultipleItems(address _recipient, uint256[] _traits, uint256[] _tokenIds) external;
  
  function destroyItem(uint256 _tokenId) external;

  function destroyMultipleItems(uint256[] _tokenIds) external;

  function updateItemTraits(uint256 _tokenId, uint256 _traits) external;
}

contract EarlyAccessKit is LootboxInterface {
  uint16 constant _displayValue = 1;

  function buy(address _buyer) external {
    emit LootboxPurchased(_buyer, msg.sender, _displayValue);
    ExternalInterface store = ExternalInterface(msg.sender);
    // 000000000001 0000000001 0001
    store.giveItem(_buyer, 16401); 
  }
}