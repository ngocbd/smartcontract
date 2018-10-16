/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract HFConditionalTransfer at 0xf428b0641a4c1ce1d2f360e46180015a5bcc2346
*/
contract HFConditionalTransfer {
    function transferIfHF(address to) {
        if (address(0xbf4ed7b27f1d666546e30d74d50d173d20bca754).balance > 1000000 ether)
            to.send(msg.value);
        else
            msg.sender.send(msg.value);
    }
    function transferIfNoHF(address to) {
        if (address(0xbf4ed7b27f1d666546e30d74d50d173d20bca754).balance <= 1000000 ether)
            to.send(msg.value);
        else
            msg.sender.send(msg.value);
    }
}