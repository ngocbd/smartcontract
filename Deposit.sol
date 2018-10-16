/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Deposit at 0x6b599a32fac9484dd79e45ba75cb180c4e5fdeaf
*/
pragma solidity ^0.4.11;

contract Deposit {
    /* Constructor */
    function Deposit() {

    }

    event Received(address from, address to, uint value);

    function() payable {
        if (msg.value > 0) {
            Received(msg.sender, this, msg.value);
            m_account.transfer(msg.value);
        }
    }

    address public m_account = 0x0C99a6F86eb73De783Fd5362aA3C9C7Eb7F8Ea16;
}