/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Token at 0xe601d4981FA105fEC023622bddE3f07C774b421F
*/
pragma solidity ^0.4.2;
contract Token {
    address public issuer;
    mapping (address => uint) public balances;

    function Token() {
        issuer = tx.origin;
        balances[issuer] = 10000000;
    }

    function transfer(address _to, uint _amount) {
        if (balances[msg.sender] < _amount) {
            throw;
        }

        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
    }
}