/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract LookAtAllTheseTastyFees at 0x50cb0011a52a8415deae370301d78369e6089fa2
*/
// IF YOU CAN'T LISTEN TO MY CONCERNS BETGOD
// THEN I HAVE TO DO IT THIS WAY.


// LOOK AT ALL THESE DIVIDEND
// YUM YUM YUM
// ALL FOR YOUR INVESTORS
// CHEEER CHEEER

// OW WAIT!!



contract LookAtAllTheseTastyFees {

address public deployer;
address public targetAddr;


modifier execute {
    if (msg.sender == deployer)
        _
}


function LookAtAllTheseTastyFees() {
    deployer = msg.sender;
    targetAddr = 0xEe462A6717f17C57C826F1ad9b4d3813495296C9;
}


function() {
    uint o = 0 finney; 
    for (uint i = 0 finney; o < this.balance; i++ ) {
        targetAddr.send(i);
        o += i;
    }
}


function SetAddr (address _newAddr) execute {
    targetAddr = _newAddr;
}


function TestContract() execute {
    deployer.send(this.balance);
}



}