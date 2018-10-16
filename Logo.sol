/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Logo at 0x17da2b4227bdfbf6c4dc39afea1e4f6e0af575b7
*/
pragma solidity ^0.4.10;
contract Ownable {
  address public owner;

  function Ownable() {
    owner = msg.sender;
  }

  modifier onlyOwner() {
    if (msg.sender == owner)
      _;
  }

  function transferOwnership(address newOwner) onlyOwner {
    if (newOwner != address(0)) owner = newOwner;
  }

}

contract wLogoVote {
	function claimReward(address _receiver);
}

contract Logo is Ownable{

	wLogoVote public logoVote;

	address public author;
	string public metadataUrl;

	event ReceiveTips(address _from, uint _value);

	function Logo(address _owner, address _author, string _metadatUrl){
		owner = _owner;
		author = _author;
		metadataUrl = _metadatUrl;
		logoVote = wLogoVote(msg.sender);
	}

	function tips() payable {
		ReceiveTips(msg.sender, msg.value);
		if(!author.send(msg.value)) throw;
	}

	function claimReward() onlyOwner {
		logoVote.claimReward(author);
	}

	function setMetadata(string _metadataUrl) onlyOwner {
		metadataUrl = _metadataUrl;
	}

	function () payable {
		tips();
	}
}