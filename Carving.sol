/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Carving at 0xD9D8e10d1aeCa671527f821B091460cD22C10e78
*/
pragma solidity ^0.4.24;

contract Mortal {
    /* Define variable owner of the type address */
    address owner;

    /* This function is executed at initialization and sets the owner of the contract */
    constructor() public { owner = msg.sender; }

    /* Function to recover the funds on the contract */
    function kill() public { if (msg.sender == owner) selfdestruct(owner); }
}

contract Carving is Mortal {
    uint16 initial1;
    uint16 initial2;

    /* This runs when the contract is executed */
    constructor(uint16 _initial1, uint16 _initial2) public {
        initial1 = _initial1;
        initial2 = _initial2;
    }

    /* Main function */
    function getInitials() public view returns (uint16, uint16) {
        return (initial1, initial2);
    }
}