/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract storadge at 0xeb3c1a7f816da958a0f8b9f4ef63a19b26d03739
*/
pragma solidity ^0.4.2;

contract storadge {
    
    event log(string description);
    
	function save(
        string mdhash
    )
    {
        log(mdhash);
    }
}