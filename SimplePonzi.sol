/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract SimplePonzi at 0x428472c5664d079eb4f035d872801241a4e8a4de
*/
contract SimplePonzi {
    address public currentInvestor;
    uint public currentInvestment = 0;
    
    function () payable public {
        require(msg.value > currentInvestment);
        
        // payout previous investor
        currentInvestor.send(currentInvestment);

        // document new investment
        currentInvestor = msg.sender;
        currentInvestment = msg.value;

    }
}