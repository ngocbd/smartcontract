/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Prism at 0x536c2622748118a82bc9fb15a450d828966d9761
*/
contract Prism {
    address constant theWithdraw = 0xbf4ed7b27f1d666546e30d74d50d173d20bca754;
    function Prism() {
        forked = theWithdraw.balance > 1 ether;
    }
    
    function transferETC(address to) {
        if (forked)
            throw;
        if (!to.send(msg.value))
            throw;
    }

    function transferETH(address to) {
        if (!forked)
            throw;
        if (!to.send(msg.value))
            throw;
    }
    
    bool public forked;
}