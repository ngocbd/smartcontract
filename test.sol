/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract test at 0x146ae435d023516de94aa17586c17d35b998a9b8
*/
pragma solidity^0.4.24;


contract test{
    address owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    
    function kill() public onlyOwner {
        uint b = address(this).balance;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         selfdestruct(owner);
    } 
}