/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Contrat at 0xcd9b780dbfcda1bd58bb07b19679b2d76e246924
*/
pragma solidity ^0.4.19;

contract Contrat {

    address owner;

    event Sent(uint indexed i, string hash);

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

    function addHash(uint i, string hashToAdd) canAddHash public {
        emit Sent(i, hashToAdd);
    }
}