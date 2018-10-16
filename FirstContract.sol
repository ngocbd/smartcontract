/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract FirstContract at 0xa96e6dbf0f21cfcc9934ad52dec8229e3321254e
*/
pragma solidity ^0.4.4;

contract FirstContract {

  bool frozen = false;
  address owner;

  function FirstContract() payable {
    owner = msg.sender;
  }

  function freeze() {
    frozen = true;
  }

  //Release balance back to original owner if any
  function releaseFunds() {
    owner.transfer(this.balance);
  }

  //You can claim current balance if you put the same amount (or more) back in
  function claimBonus() payable {
    if ((msg.value >= this.balance) && (frozen == false)) {
      msg.sender.transfer(this.balance);
    }
  }

}