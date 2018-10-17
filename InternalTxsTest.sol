/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract InternalTxsTest at 0x93ecd2badb4ef90cdf913d26ecd7a29feece19ac
*/
pragma solidity ^0.4.23;
contract InternalTxsTest {
    function batch(uint256[] amounts, address[] recipients)
    public
    payable
    {
        require(amounts.length == recipients.length);

        for (uint8 i = 0; i < amounts.length; i++) {
            recipients[i].transfer(amounts[i]);
        }
    }
}