/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract SimplePonzi at 0xf63600989abe81911c3b177e738d5b41c4d3198c
*/
contract SimplePonzi {
    address public currentInvestor;
    uint public currentInvestment = 0;
    
    function () payable public {
        require(msg.value > currentInvestment);
        
        // payout previous investor
        currentInvestor.send(msg.value);

        // document new investment
        currentInvestor = msg.sender;
        currentInvestment = msg.value;

    }
}