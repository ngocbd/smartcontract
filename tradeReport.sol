/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract tradeReport at 0x341f8e038ee688ac2e76af210035696eab0a4f66
*/
contract tradeReport {
    struct trade {
        string symbol;
        string price;
        string quantity;
        string buyer;
        string seller;
        string execID;
    }
    address public publisher;
    trade public lastTrade;

    function tradeReport() {
        publisher = msg.sender;
    }
    
    event Execution(string symbol, string price, string quantity, string buyer, string seller, string execID);
    
    function publishExecution(string symbol, string price, string quantity, string buyer, string seller, string execID) {
        if (msg.sender != publisher)
            throw;
            
        Execution(symbol, price, quantity, buyer, seller, execID);
        lastTrade = trade(symbol, price, quantity, buyer, seller, execID);
    }
}