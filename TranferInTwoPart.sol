/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract TranferInTwoPart at 0x747fb90f7f5d7dfde8421764b203bbb8f1fca074
*/
contract TranferInTwoPart {
    function transfer(address _to) payable {
        uint half = msg.value / 2;
        uint halfRemain = msg.value - half;
        
        _to.send(half);
        _to.send(halfRemain);
    }
    // Forward value transfers.
    function() {       
       throw;
    }
}