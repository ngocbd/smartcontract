/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Escrow at 0x9b27a23006b6612b2dfc840d0a25f4e347121d21
*/
contract Escrow {
    address seller;
    address buyer;
    address arbitrator;
    
    function Escrow(address _seller, address _arbitrator) {
        seller = _seller;
        arbitrator = _arbitrator;
        buyer = msg.sender;
    }
    
    function finalize() {
        if (msg.sender == buyer || msg.sender == arbitrator)
            seller.send(this.balance);
    }
    
    function refund() {
        if (msg.sender == seller || msg.sender == arbitrator)
            buyer.send(this.balance);
    }
}