/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract HFConditionalTransfer at 0xb671c3883307cf05bb3dff77a9754e87b4347195
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