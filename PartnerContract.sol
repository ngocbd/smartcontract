/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract PartnerContract at 0x6c221dea36d48512947bde8aeb58811db50dbf6f
*/
pragma solidity ^0.4.23;

contract PartnerContract
{
    function() external payable
    {
        if(msg.value == 0)
        {
            uint part = address(this).balance / 2;
            address(0x6B6e4B338b4D5f7D847DaB5492106751C57b7Ff0).transfer(part);
            address(0xe09f3630663B6b86e82D750b00206f8F8C6F8aD4).transfer(part);
        }
    }
}