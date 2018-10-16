/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Lottery at 0x97cc6d32fbe7063bf7540474949df51b338a2695
*/
pragma solidity ^0.4.2;


contract Lottery {

    /*
     * checks only owner address is calling
    */
    modifier onlyOwner 
    {
        require(msg.sender == owner);
         _;
    }

    /*
     * game vars
    */
    address public owner;

    uint private randomNumber;  //????randomNumber?????????????

    /*
     * events
    */
    event LogRandNumberBC(uint64 taskID,uint16 randomNum);

    /*
     * init
    */
    constructor() public {
        owner = msg.sender;
    }

    function RollLottery(uint64 taskID) public
        onlyOwner
    {
        uint16 randResult;

        randomNumber 	= uint(keccak256(randomNumber,taskID,block.difficulty)) * uint(blockhash(block.number - 1));
        randResult 		= uint16(randomNumber % 1000);

        emit LogRandNumberBC(taskID,randResult);
    }


    function ()
        public payable
    {
        return;
    }


    /* only owner address can set owner address */
    function ownerChangeOwner(address newOwner) public
        onlyOwner
    {
        owner = newOwner;
    }

    /* only owner address can suicide - emergency */
    function ownerkill() public
        onlyOwner
    {
        selfdestruct(owner);
    }

}