/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract UportRegistry at 0x022f41a91cb30d6a20ffcfde3f84be6c1fa70d60
*/
contract UportRegistry {
  event AttributesSet(address indexed _sender, uint _timestamp);

  uint public version;
  address public previousPublishedVersion;

  mapping(address => bytes) public ipfsAttributeLookup;

  function UportRegistry(address _previousPublishedVersion) {
    version = 1;
    previousPublishedVersion = _previousPublishedVersion;
  }

  function setAttributes(bytes ipfsHash) {
    ipfsAttributeLookup[msg.sender] = ipfsHash;
    AttributesSet(msg.sender, now);
  }

  function getAttributes(address personaAddress) constant returns(bytes) {
    return ipfsAttributeLookup[personaAddress];
  }
}