/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract AuctionItem at 0x91d0013742c6a6a033d46ac9da7b5e0416c35e24
*/
pragma solidity ^0.4.11;

contract AuctionItem {
    
    string public auctionName;
    address public owner; 
    bool auctionEnded = false;
    
    event NewHighestBid(
        address newHighBidder,
        uint newHighBid,
        string squak
    );
    
    uint public currentHighestBid = 0;
    address public highBidder; 
    string public squak;

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    modifier higherBid {
        require(msg.value > currentHighestBid);
        _;
    }
    
    modifier auctionNotOver {
        require(auctionEnded == false);
        _;
    }
    
    function AuctionItem(string name, uint startingBid) {
        auctionName = name; 
        owner = msg.sender;
        currentHighestBid = startingBid;
    }
    
    //allow people using MetaMask/Cipher et. al. to specifically set a taunting message ;)
    function bid(string _squak) payable higherBid auctionNotOver {
        highBidder.transfer(currentHighestBid);
        currentHighestBid = msg.value;
        highBidder = msg.sender;
        squak = _squak;
        NewHighestBid(msg.sender, msg.value, _squak);

        }
    //allow people with basic wallets to send a bid (QR scan etc.), but no squaking for them 
    function() payable higherBid auctionNotOver{
        highBidder.transfer(currentHighestBid);
        currentHighestBid = msg.value;
        highBidder = msg.sender;
        NewHighestBid(msg.sender, msg.value, '');
        
    }
    //The owner should be able to end the auction
    function endAuction() onlyOwner{
        selfdestruct(owner);
        auctionEnded = true;
    }

    
}