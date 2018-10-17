/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract LoeriadeNabidaz at 0x029cb57991b2a2cad9271b8c4131bb8551982014
*/
pragma solidity ^0.4.22;
contract LoeriadeNabidaz{
    uint public c;
    
    function pay() payable public {
        require(msg.value==0.0001 ether);
        c = c+1;
        if(c==2) {
            msg.sender.transfer(this.balance);
            c = 0;
        }
    }
}