/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract TestHello at 0x3635197ea6db5CcC706aF7360e8665547da045fA
*/
pragma solidity ^0.4.0;
contract TestHello {
    event logite(string name);

    /// Create a new ballot with $(_numProposals) different proposals.
    function TestHello() public {
        logite("HELLO_TestHello");
    }


    /// Delegate your vote to the voter $(to).
    function logit() public {
        logite("LOGIT_TestHello");
    }
}