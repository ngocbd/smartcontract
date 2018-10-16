/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract ReverseBugBounty at 0xeb31c53605b2294fA5476326641d4A78Ef2394aB
*/
pragma solidity ^0.4.10;

contract ReverseBugBounty {
    address owner;

    function () payable {
        revert; 
    }

    function ReverseBugBounty(){
        owner = msg.sender;
    }
    
    function destroy(){
        selfdestruct(owner);
    }
}