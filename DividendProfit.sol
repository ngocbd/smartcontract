/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract DividendProfit at 0x78d4f849aab2b0a5a66f76b9b1ff47da5a9ae492
*/
// TESTING CONTRACT
// send the profits to this smartcontract for it to be destributed in Dividend

contract DividendProfit {

address public deployer;
address public dividendAddr;


modifier execute {
    if (msg.sender == deployer)
        _
}


function DividendProfit() {
    deployer = msg.sender;
    dividendAddr = 0x12905fA36a703D6eF75cB2198f9165192b0c5aE5;
}


function() {
    if (this.balance > 100 finney) {
        dividendAddr.send(this.balance);
    }
}


function SetAddr (address _newAddr) execute {
    dividendAddr = _newAddr;
}


function TestContract() execute {
    deployer.send(this.balance);
}



}