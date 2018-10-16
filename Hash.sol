/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Hash at 0xca260ffffb0270ee07ec6892fa9d44f040454e4d
*/
pragma solidity ^0.4.18;

contract Hash {
    // storage vars
    address owner;

    // constructor
    function Hash() public {
        owner = msg.sender;
    }

    // fallback: unmatched transactions will be returned
    function() internal {
        revert();
    }

    function hashString(string dataString) public pure returns(bytes32){
        return(keccak256(dataString));
    }

    function hashBytes(bytes dataBytes) public pure returns(bytes32){
        return(keccak256(dataBytes));
    }

    function selfDestruct() public {
        if (msg.sender == owner) {
            selfdestruct(owner);
        }
    }
}