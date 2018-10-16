/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract TokenBurner at 0x8c9f657fe6049f7e5890b3f67f45a2e7a6e0048f
*/
pragma solidity ^0.4.16;

contract TokenBurner {
    address private _burner;

    function TokenBurner() public {
        _burner = msg.sender;
    }

    function () payable public {
    }

    function BurnMe () public {
        // Only let ourselves be able to burn
        if (msg.sender == _burner) {
            // Selfdestruct and send tokens to self, to burn them 
            selfdestruct(address(this));
        }
        
    }
}