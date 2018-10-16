/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract EthernalMessageBook at 0xc63E08cFBa867C03A862BB1c9fb9c83AA096B3A5
*/
pragma solidity ^0.4.23;

contract EthernalMessageBook {

    struct Message {
        string msg;
        uint value;
        address sourceAddr;
        string authorName;
        uint time;
        uint blockNumber;
        string metadata;
        string link;
    }

    Message[] public messages;

    address private root;

    uint public price;
    uint public startingPrice;

    uint32 public multNumerator;
    uint32 public multDenominator;

    constructor(uint argStartPrice, uint32 argNumerator, uint32 argDenominator) public {
        root = msg.sender;
        price = argStartPrice;
        startingPrice = argStartPrice;

        require(argNumerator > multDenominator);
        multNumerator = argNumerator;
        multDenominator = argDenominator;
    }

    function getMessagesCount() public view returns (uint) {
        return messages.length;
    }

    function getSummary() public view returns (uint32, uint32, uint, uint) {
        return (
            multNumerator,
            multDenominator,
            startingPrice,
            messages.length
        );
    }

    function writeMessage(string argMsg, string argAuthorName, string argLink, string argMeta) public payable {
        require(msg.value >= price);
        Message memory newMessage = Message({
            msg : argMsg,
            value : msg.value,
            sourceAddr : msg.sender,
            authorName : argAuthorName,
            time : block.timestamp,
            blockNumber : block.number,
            metadata : argMeta,
            link: argLink
        });
        messages.push(newMessage);
        address thisContract = this;
        root.transfer(thisContract.balance);
        price = (price * multNumerator) / multDenominator;
    }
}