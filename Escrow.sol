/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Escrow at 0x665f2d9e0ea20573255ecddb2d597bf94ef30784
*/
contract Escrow {
    address buyer;
    address seller;
    address arbitrator;

    function Escrow() payable {
       seller = 0x5ed8cee6b63b1c6afce3ad7c92f4fd7e1b8fad9f;
       buyer = msg.sender;
       arbitrator = 0xabad6ec946eff02b22e4050b3209da87380b3cbd;
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