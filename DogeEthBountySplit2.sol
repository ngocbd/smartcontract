/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract DogeEthBountySplit2 at 0xbc2eadd8dbc9f08e924550c8138e5f4e6c64489e
*/
pragma solidity ^0.4.18;
contract DogeEthBountySplit2 {

    // Just hardcode externally owned accounts, don’t use contract addresses.
    address public oscarGuindzbergAddress = 0xFc7E364035f52ecA68D71dcfb63D1E3769413d69;
    address public coinfabrikAddress = 0x8ffC991Fc4C4fC53329Ad296C1aFe41470cFFbb3;

    function() payable public {
    }    
   
    function withdraw() public {
        uint balance = address(this).balance;
        uint half = balance / 2;
        oscarGuindzbergAddress.transfer(half);
        coinfabrikAddress.transfer(half);
    }
}