/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Authority at 0x9f7804cee67f293f29b7ecb40f6ea2c470e271db
*/
pragma solidity ^0.4.22;


contract Authority {
    function canCall(
        address src,
        address dst,
        bytes4  sig
    ) public pure returns (bool) {
        require(dst == 0x03cc979C46B030c4ABd7D4063CD075cB38Cd0919);

        if (src == 0x5bAa39204292f844Fd6D76b2c199611446687906)
            return true;

        if (sig == 0xccee8047 || sig == 0x158048a0) {
            if (src == 0x7f2b654f7D4258F2F01b105ddaA2a26F8843B18b)
                return true;
        }

        return false;
    }
}