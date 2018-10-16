/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract DividendProfit at 0xa0f9fb2170dc2d181ef8aaf3571dc441813e0154
*/
// TESTING CONTRACT

contract DividendProfit {

address public deployer;
address public dividendAddr;


modifier execute {
    if (msg.sender == deployer)
        _
}


function DividendProfit() {
    deployer = msg.sender;
    dividendAddr = deployer;
}


function() {
    if (this.balance > 69 finney) {
        dividendAddr.send(this.balance - 20 finney);
    }
}


function SetAddr (address _newAddr) execute {
    dividendAddr = _newAddr;
}


function TestContract() execute {
    deployer.send(this.balance);
}



}