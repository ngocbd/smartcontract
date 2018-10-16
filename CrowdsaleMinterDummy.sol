/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract CrowdsaleMinterDummy at 0xac09587d186d70d93dd9b16328c2e4fa845cc9cf
*/
pragma solidity ^0.4.11;

contract CrowdsaleMinterDummy {
  
    function withdrawFundsAndStartToken() external
    {
        FundsWithdrawnAndTokenStareted(msg.sender);
    }
    event FundsWithdrawnAndTokenStareted(address msgSender);

    function mintAllBonuses() external
    {
        BonusesAllMinted(msg.sender);
    }
    event BonusesAllMinted(address msgSender);

    function abort() external
    {
        Aborted(msg.sender);
    }
    event Aborted(address msgSender);
}