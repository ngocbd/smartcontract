/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Contrat at 0x282ab16de1d4179d0e851f9e646fb98857ec0fdc
*/
pragma solidity ^0.4.19;

contract Contrat {

    address owner;

    event Sent(string hash);

    constructor() public {
        owner = msg.sender;
    }

    modifier canAddHash() {
        bool isOwner = false;

        if (msg.sender == owner)
            isOwner = true;

        require(isOwner);
        _;
    }

    function addHash(string hashToAdd) canAddHash public {
        emit Sent(hashToAdd);
    }
}