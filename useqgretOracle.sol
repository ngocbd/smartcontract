/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract useqgretOracle at 0x768e66ef1ea28ec0b1380a71577a2a83d78d32a4
*/
pragma solidity ^0.4.18;
// US gross value-weighted daily stock return w/o dividends
// 0.10251 ETH balance implies a 1.0251 gross return, 2.51% net return
// pulled using closing prices around 4:15 PM EST 
contract useqgretOracle{
    
    address private owner;

    function useqgretOracle() 
        payable 
    {
        owner = msg.sender;
    }
    
    function updateUSeqgret() 
        payable 
        onlyOwner 
    {
        owner.transfer(this.balance-msg.value);
    }
    
    modifier 
        onlyOwner 
    {
        require(msg.sender == owner);
        _;
    }

}